import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pentagonselllit/Elements/LoadingIndicator.dart';
import 'package:pentagonselllit/Elements/Pages/ClientPages/ShopHomePage.dart';
import 'package:pentagonselllit/Elements/Pages/ClientPages/ShopProductsPage.dart';
import 'package:pentagonselllit/Elements/Pages/UnknownPage.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';
import 'package:pentagonselllit/args.dart' as args;

import '../TempView.dart';

List<ItemModel> itemsCollection;
String totalShopID;

class ClientCollectionPage extends StatefulWidget {
  String domain;
  List<String> tags;
  ClientCollectionPage({this.domain, this.tags, Key key}) : super(key: key);

  @override
  _ClientCollectionPageState createState() => _ClientCollectionPageState();
}

class _ClientCollectionPageState extends State<ClientCollectionPage> {
  bool finishLoad = false;
  bool hasShop = true;
  bool loadTheme = false;
  List<ItemModel> items = [];
  List<Widget> widgets = [];
  String shopIDZ = "";
  @override
  Widget build(BuildContext context) {
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
        print("shoppppID: " + shopID);
        totalShopID = shopID;
        print("has shop: " + hasShop.toString());
        if (args.products.length == 0 && hasShop) {
          print("length: " + (args.products.length == 0).toString());
          print("length: " + args.products.length.toString());
          Future<QuerySnapshot> snapshot2 = FirebaseFirestore.instance
              .collection("sites")
              .document(totalShopID)
              .collection("items")
              .get();

          snapshot2.then((snap) {
            List<ItemModel> now = [];
            snap.docs.forEach((element) {
              print("tagsz: " + widget.tags.toString());
              ItemModel item = ItemModel.fromMap(element.data());
              bool valid = true;
              if (widget.tags.length > 0) {
                if (item.tags != null) {
                  for (String current_tag in widget.tags) {
                    if (!item.tags.contains(current_tag)) {
                      valid = false;
                    }
                  }
                  if (valid) {
                    now.add(item);
                  }
                }
              } else {
                now.add(item);
              }
            });
            setState(() {
              print("didnt load: loaded 3 " + args.products.length.toString());
              finishLoad = true;
              if (snap.docs.length == 0) {
                hasShop = false;
                print("has no shopID");
              } else {
                items = now;
                args.products = items;
                shopIDZ = shopID;
                return TemplateView(widgets: ShopProductPageStyle2(context));
              }
            });
          });
        } else {
          setState(() {
            print("didnt load 3");
            finishLoad = true;
            items = args.products;
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
    return Container(
      child: TemplateView(widgets: ShopProductPageStyle2(context)),
    );
  }
}
