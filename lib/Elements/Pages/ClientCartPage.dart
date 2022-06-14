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
import 'package:pentagonselllit/database.dart' as database;

import '../../Models/ItemCartModel.dart';
import '../../Models/ShopModel.dart';
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
Future<List<String>> setPrefernce() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  _items = pref.getStringList('cart');
  if (_items.length == 0) {
    _items = null;
  }
  return _items;
}

class _ClientCartPageState extends State<ClientCartPage> {
  List<ItemCartModel> cart;
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    if (args.shopModel == null) {
      return FutureBuilder(
        future: database.load_shop(context, widget.domain, globalKey),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loading_indicator(context);
          } else {
            if (snapshot.hasError || snapshot.data == null) {
              return UnknownPage();
            } else {
              args.shopModel = snapshot.data;
              return ClientCartPage(
                domain: widget.domain,
              );
            }
          }
        },
      );
    }
    return FutureBuilder(
        future: setPrefernce(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (_items != null) {
            List<ItemCartModel> models = [];
            for (String item in _items) {
              ItemCartModel m = ItemCartModel.fromMap(json.decode(item));
              models.add(m);
            }
            return Container(
              child: TemplateView(
                widgets: ShopCartPage(
                  cart: models,
                  shippingPrice: int.parse(args.shopModel.shippingPrice),
                  minimumShipping: int.parse(args.shopModel.minimumShipping),
                ),
              ),
            ); // your widget
          } else
            return Container(
              child: TemplateView(
                widgets: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: Lottie.asset(
                        "../../../../../../../../../../../../../../../assets/empty-bag.json",
                        repeat: true),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text("Cart is Empty",
                            style: TextStyle(fontSize: 30))),
                  ),
                  Container(
                    height: 600,
                  ),
                ]),
              ),
            );
        });
  }
}
