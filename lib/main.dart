import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pentagonselllit/Elements/Pages/ClientHomePage.dart';
import 'package:pentagonselllit/Elements/Pages/ClientPages/ShopProductsPage.dart';
import 'package:pentagonselllit/Elements/Pages/UnknownPage.dart';
import 'package:pentagonselllit/Elements/TempView.dart';
import 'package:pentagonselllit/args.dart';
import 'package:pentagonselllit/database.dart';
import 'package:pentagonselllit/product_route_pth.dart';
import 'package:pentagonselllit/route.dart';
import 'dart:html';
import 'package:url_strategy/url_strategy.dart';
import './Elements/Appbars.dart';
import 'Elements/Pages/SelllitLanding.dart';
import 'Models/ItemModel.dart';
import 'package:pentagonselllit/args.dart' as args;

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var url = window.location.href;
  String URL = "";
  List<String> parms;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> optionsz = [];
    optionsz.add({
      "Color": ['red', 'blue']
    });
    optionsz.add({
      "Size": ['S', 'M']
    });
    URL = url
        .toString()
        .replaceAll("https://", "")
        .replaceAll("http://", "")
        .replaceAll("/", "");
    parms = URL.split(".");
    print(parms[0].toString());
    if (parms[0] == "selllit" || parms[0] == "selllitgenius") {
      return MaterialApp(
        title: "Selllit",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LandingPage(),
      );
    }

    return MaterialApp.router(
      title: parms[0].toString(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: SellitRouterDelegate(),
      routeInformationParser: SellitRouteInformationParser(),
    );
  }
}
