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
import 'ClientPages/ShopProductPage.dart';

List<ItemModel> itemsCollection;
String totalShopID;

class ClientProductPage extends StatefulWidget {
  String domain;
  String product_id;
  ClientProductPage({this.domain, Key key, this.product_id}) : super(key: key);

  @override
  _ClientProductPageState createState() => _ClientProductPageState();
}

class _ClientProductPageState extends State<ClientProductPage> {
  bool finishLoad = false;
  bool hasShop = true;
  bool loadTheme = false;
  ItemModel product = null;
  String shopIDZ = "";
  @override
  Widget build(BuildContext context) {
    if (!finishLoad) {
      if (!args.products.isEmpty && args.shopID != "") {
        for (ItemModel model in args.products) {
          if (model.id == widget.product_id) {
            setState(() {
              product = model;
              finishLoad = true;
            });
          }
        }
      }
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
