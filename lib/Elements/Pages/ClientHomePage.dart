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
import 'package:pentagonselllit/database.dart' as database;

import '../../Models/ShopModel.dart';
import '../TempView.dart';

List<ItemModel> itemsCollection;

class ClientHomePage extends StatefulWidget {
  String domain;
  ClientHomePage({this.domain, Key key}) : super(key: key);

  @override
  _ClientHomePageState createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    print("In Home page");
    if (args.shopModel == null)
      return FutureBuilder(
          future: database.load_shop(context, "shop", globalKey),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return loading_indicator(context);
            } else {
              if (snapshot.hasError || snapshot.data == null) {
                return UnknownPage();
              } else {
                ShopModel x = snapshot.data;
                args.shopModel = x;
                return ShopHomePage(
                  globalKey: globalKey,
                );
              }
            }
          });
    return ShopHomePage(globalKey: globalKey);
  }
}
