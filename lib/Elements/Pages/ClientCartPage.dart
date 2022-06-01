import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pentagonselllit/Elements/LoadingIndicator.dart';
import 'package:pentagonselllit/Elements/Pages/ClientPages/ShopHomePage.dart';
import 'package:pentagonselllit/Elements/Pages/ClientPages/ShopProductsPage.dart';
import 'package:pentagonselllit/Elements/Pages/UnknownPage.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';
import 'package:pentagonselllit/args.dart' as args;

import '../../Models/ItemCartModel.dart';
import '../TempView.dart';
import 'ClientPages/ShopProductPage.dart';

List<ItemModel> itemsCollection;
String totalShopID;

class ClientCartPage extends StatefulWidget {
  String domain;
  ClientCartPage({this.domain, Key key}) : super(key: key);

  @override
  _ClientCartPageState createState() => _ClientCartPageState();
}

class _ClientCartPageState extends State<ClientCartPage> {
  bool finishLoad = false;
  bool hasShop = true;
  bool loadTheme = false;
  ItemModel product = null;
  String shopIDZ = "";
  List<ItemCartModel> cart;
  @override
  Widget build(BuildContext context) {
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
          } else {
            finishLoad = true;
          }
        });
        //Check cart options and load them
      });
    }

    if (!finishLoad) {
      return loading_indicator(context);
    }
    if (!hasShop) {
      return UnknownPage();
    }
    return Container(
      child: TemplateView(
        widgets: ShopProductPage1(
          productz: product,
        ),
      ),
    );
  }
}
