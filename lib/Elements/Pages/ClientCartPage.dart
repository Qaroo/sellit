import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:pentagonselllit/Elements/LoadingIndicator.dart';
import 'package:pentagonselllit/Elements/Pages/ClientPages/ShopCartPage.dart';
import 'package:pentagonselllit/Elements/Pages/ClientPages/ShopHomePage.dart';
import 'package:pentagonselllit/Elements/Pages/ClientPages/ShopProductsPage.dart';
import 'package:pentagonselllit/Elements/Pages/UnknownPage.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';
import 'package:pentagonselllit/args.dart' as args;
import 'package:shared_preferences/shared_preferences.dart';

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

List<String> _items = [];
Future<List<String>> setUserid() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  _items = pref.getStringList('cart');
  print("items123: " + _items.toString());
  return _items;
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
    print("check1234");
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

    return FutureBuilder(
        future: setUserid(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (_items != null) {
            List<ItemCartModel> models = [];
            for (String item in _items) {
              ItemCartModel m = ItemCartModel.fromMap(json.decode(item));
              models.add(m);
            }
            print("models123: " + models.toString());

            return Container(
              child: TemplateView(
                widgets: ShopCartPage(
                  cart: models,
                ),
              ),
            ); // your widget
          } else
            return Container(
              child: TemplateView(
                widgets: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    child: Lottie.asset(
                        "../../../../../../../../../../../../../../../assets/error_animation.json",
                        repeat: false),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text("Cart is Empty",
                            style: TextStyle(fontSize: 30))),
                  )
                ]),
              ),
            );
        });
  }
}
