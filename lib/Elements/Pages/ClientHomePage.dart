import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pentagonselllit/Elements/LoadingIndicator.dart';
import 'package:pentagonselllit/Elements/Pages/ClientPages/ShopHomePage.dart';
import 'package:pentagonselllit/Elements/Pages/UnknownPage.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';
import 'package:pentagonselllit/Models/sidebar/SidebarCategoryConatinerModel.dart';
import 'package:pentagonselllit/Models/sidebar/SidebarCategoryImageModel.dart';
import 'package:pentagonselllit/Models/sidebar/SidebarCategoryModel.dart';
import 'package:pentagonselllit/args.dart' as args;

List<ItemModel> itemsCollection;

class ClientHomePage extends StatefulWidget {
  String domain;
  ClientHomePage({this.domain, Key key}) : super(key: key);

  @override
  _ClientHomePageState createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  bool finishLoad = false;
  bool hasShop = true;
  bool loadTheme = false;
  bool loadMenu = false;
  List<ItemModel> items = [];
  List<Widget> widgets = [];
  @override
  Widget build(BuildContext context) {
    if (!args.Menu.isEmpty) {
      loadMenu = true;
    }
    if (args.shopID != "" && !args.products.isEmpty) {
      finishLoad = true;
    }
    if (!finishLoad) {
      FirebaseFirestore.instance
          .collection("domains")
          .doc(widget.domain)
          .get()
          .then((event) {
        setState(() {
          if (event.data() == null) {
            print("has no domain named: " + widget.domain);
            hasShop = false;
            finishLoad = true;
          }
        });
        String shopID = event.data()["shopID"].toString();
        args.shopID = shopID;
        if (args.products.isEmpty && hasShop) {
          FirebaseFirestore.instance
              .collection("sites")
              .doc(args.shopID)
              .collection("items")
              .get()
              .then((snap) {
            List<ItemModel> now = [];
            snap.docs.forEach((element) {
              print("Load item");

              ItemModel item = ItemModel.fromMap(element.data());
              now.add(item);
            });
            setState(() {
              finishLoad = true;
              if (snap.docs.length == 0) {
                hasShop = false;
              } else {
                items = now;
                args.products = items;
                return ShopHomePage(shopID: shopID);
              }
            });
          });
        } else {
          setState(() {
            finishLoad = true;
            hasShop = true;
          });
        }
      });
    }
    if (!finishLoad) {
      return loading_indicator(context);
    }
    if (!hasShop) {
      print('unknownnnn');
      return UnknownPage();
    }
    if (finishLoad && !loadMenu) {
      FirebaseFirestore.instance
          .collection("sites")
          .doc(args.shopID)
          .get()
          .then((siteSettings) {
        print("Load settings");

        String menuType = siteSettings.data()["menuType"];
        args.menuType = menuType;
        args.menuLogo = siteSettings.data()["menuLogo"];

        FirebaseFirestore.instance
            .collection("sites")
            .doc(args.shopID)
            .collection("menu")
            .get()
            .then((value) {
          print("Load menu");

          if (menuType == "category") {
            List<SidebarCategoryModel> menu = [];
            value.docs.forEach((element) {
              menu.add(SidebarCategoryModel.fromMap(element.data()));
            });
            args.Menu = menu;
            setState(() {
              loadMenu = true;
            });
          }
          if (menuType == "image") {
            List<SidebarCategoryImageModel> menu = [];
            value.docs.forEach((element) {
              menu.add(SidebarCategoryImageModel.fromMap(element.data()));
            });
            args.Menu = menu;
            setState(() {
              loadMenu = true;
            });
          }
          if (menuType == "container") {
            List<SidebarCategoryContainerModel> menu = [];
            value.docs.forEach((element) {
              menu.add(SidebarCategoryContainerModel.fromMap(element.data()));
            });
            args.Menu = menu;
            setState(() {
              loadMenu = true;
            });
          }
        });
      });
    }

    return Container(
      child: ShopHomePage(shopID: args.shopID),
    );
  }
}
