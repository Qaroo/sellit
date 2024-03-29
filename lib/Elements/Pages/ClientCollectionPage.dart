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

import '../../Models/ShopModel.dart';
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
  GlobalKey<ScaffoldState> globalKey;
  String shopIDZ = "";
  @override
  Widget build(BuildContext context) {
    if (args.shopModel == null) {
      return FutureBuilder(
          future: database.load_shop(context, widget.domain, globalKey),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return loading_indicator(context);
            } else {
              if (snapshot.hasError || snapshot.data == null) {
                return UnknownPage();
              } else {
                ShopModel x = snapshot.data;
                args.shopModel = x;
                return Container(
                  child: TemplateView(
                      widgets: ShopProductPageStyle2(context, widget.tags)),
                );
              }
            }
          });
    } else {
      return Container(
        child:
            TemplateView(widgets: ShopProductPageStyle2(context, widget.tags)),
      );
    }
  }
}
