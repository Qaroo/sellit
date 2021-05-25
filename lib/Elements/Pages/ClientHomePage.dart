import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pentagonselllit/Elements/LoadingIndicator.dart';
import 'package:pentagonselllit/Elements/Pages/ClientPages/ShopHomePage.dart';
import 'package:pentagonselllit/Elements/Pages/UnknownPage.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';

List<ItemModel> itemsCollection;
String totalShopID;

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
  List<ItemModel> items = [];
  List<Widget> widgets = [];
  String shopIDZ = "";
  @override
  Widget build(BuildContext context) {
    print("hdsadas2");
    FirebaseFirestore.instance
        .collection("sites")
        .doc("pentagon")
        .snapshots()
        .listen((event) {
      print("hdsadas");
    });
    if (!finishLoad) {
      FirebaseFirestore.instance
          .collection("domains")
          .doc(widget.domain)
          .snapshots()
          .listen((event) {
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
        if (items.isEmpty && hasShop) {
          print("start");
          Future<QuerySnapshot> snapshot2 = FirebaseFirestore.instance
              .collection("sites")
              .document(totalShopID)
              .collection("items")
              .getDocuments();

          snapshot2.then((snap) {
            List<ItemModel> now = [];
            snap.docs.forEach((element) {
              ItemModel item = ItemModel.fromMap(element.data());
              if (element.data()['sizes'] != null)
                item.sizes = element.data()['sizes'];
              now.add(item);
            });
            setState(() {
              print("snap: " + snap.docs.length.toString());
              print("finish " + totalShopID);
              finishLoad = true;
              if (snap.docs.length == 0) {
                hasShop = false;
                print("has no shopID");
              } else {
                items = now;
                shopIDZ = shopID;
                return ShopHomePage(shopID: shopID);
              }
            });
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
      child: ShopHomePage(shopID: shopIDZ),
    );
  }
}
