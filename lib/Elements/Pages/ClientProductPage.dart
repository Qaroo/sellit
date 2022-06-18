import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pentagonselllit/Elements/LoadingIndicator.dart';
import 'package:pentagonselllit/Elements/Pages/ClientPages/ShopHomePage.dart';
import 'package:pentagonselllit/Elements/Pages/ClientPages/ShopProductsPage.dart';
import 'package:pentagonselllit/Elements/Pages/UnknownPage.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';
import 'package:pentagonselllit/args.dart' as args;
import 'package:pentagonselllit/database.dart' as database;

import '../TempView.dart';
import 'ClientPages/ShopProductPage.dart';
import '../../Models/ShopModel.dart';

List<ItemModel> itemsCollection;
String totalShopID;

class ClientProductPage extends StatefulWidget {
  String domain;
  String item_id;
  ClientProductPage({this.domain, this.item_id, Key key}) : super(key: key);

  @override
  _ClientProductPageState createState() => _ClientProductPageState();
}

class _ClientProductPageState extends State<ClientProductPage> {
  final globalKey = GlobalKey<ScaffoldState>();
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
              return ClientProductPage(
                domain: widget.domain,
                item_id: widget.item_id,
              );
            }
          }
        },
      );
    }
    return FutureBuilder(
        future: database.load_item(widget.item_id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loading_indicator(context);
          } else {
            if (snapshot.hasError || snapshot.data == null) {
              return UnknownPage();
            } else {
              return TemplateView(
                  widgets: ShopProductPage1(item: snapshot.data));
            }
          }
        });
  }
}
