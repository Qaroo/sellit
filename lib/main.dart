import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pentagonselllit/Elements/Pages/ClientHomePage.dart';
import 'package:pentagonselllit/Elements/Pages/ClientPages/ShopProductsPage.dart';
import 'package:pentagonselllit/Elements/Pages/UnknownPage.dart';
import 'package:pentagonselllit/Elements/TempView.dart';
import 'package:pentagonselllit/args.dart';
import 'package:pentagonselllit/product_route_pth.dart';
import 'package:pentagonselllit/route.dart';
import 'dart:html';
import 'package:url_strategy/url_strategy.dart';
import './Elements/Appbars.dart';
import 'Elements/Pages/SelllitLanding.dart';
import 'Models/ItemModel.dart';

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
    FirebaseFirestore.instance
        .collection("hello")
        .doc("hi")
        .set({"User": "Ilay"});
    print("set this");
    print("vErSiOn: 1.0.9");
    List<ItemModel> xxx = [
      ItemModel(
        brand: "OFF WHITE X VANS",
        name: "Low Vulcenaized Sneakers",
        price: "500",
        image1:
            "https://cashcow-cdn.azureedge.net/images/73051db0-83d4-42a3-a578-caa6c473fe35.png",
        category: "sneakers",
        gender: "men",
        description: "Mootag",
        id: "00001",
        sizes: {
          "39": 1,
          "40": 1,
          "41": 1,
          "42": 1,
          "43": 1,
          "44": 1,
          "45": 1,
          "46": 1,
          "47": 1,
          "48": 1,
          "49": 1,
        },
      ),
      ItemModel(
        brand: "OFF WHITE",
        name: "Dokrim's Sneakers",
        price: "500",
        image1:
            "https://cashcow-cdn.azureedge.net/images/810947ce-67a0-4789-a315-edad282bb55d.png",
        category: "sneakers",
        gender: "men",
        description: "Mootag",
        id: "00002",
        sizes: {
          "39": 1,
          "40": 1,
          "41": 1,
          "42": 1,
          "43": 1,
          "44": 1,
          "45": 1,
          "46": 1,
          "47": 1,
          "48": 1,
          "49": 1,
        },
      ),
      ItemModel(
        brand: "OFF WHITE X CONVERCE",
        name: "Normal",
        price: "500",
        image1:
            "https://cashcow-cdn.azureedge.net/images/12c5f875-f228-4a66-881e-792dece4af2f_500.png?v=2",
        category: "sneakers",
        gender: "men",
        description: "Mootag",
        id: "00003",
        sizes: {
          "39": 1,
          "40": 1,
          "41": 1,
          "42": 1,
          "43": 1,
          "44": 1,
          "45": 1,
          "46": 1,
          "47": 1,
          "48": 1,
          "49": 1,
        },
      ),
      ItemModel(
        brand: "OFF WHITE X JORDAN",
        name: "Jordan amp",
        price: "500",
        image1:
            "https://images.stockx.com/images/Air-Jordan-1-Retro-High-Off-White-University-Blue-Product.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&q=90&dpr=2&trim=color&updated_at=1606321054",
        category: "sneakers",
        gender: "men",
        description: "Mootag",
        id: "00004",
        sizes: {
          "39": 1,
          "40": 1,
          "41": 1,
          "42": 1,
          "43": 1,
          "44": 1,
          "45": 1,
          "46": 1,
          "47": 1,
          "48": 1,
          "49": 1,
        },
      ),
      ItemModel(
        brand: "OFF WHITE X VANS",
        name: "Low Vulcenaized Sneakers",
        price: "500",
        image1:
            "https://cdn.istores.co.il/image/upload/if_ar_gt_2:1/c_fill,h_662,w_555/c_fill,h_662,w_555/if_else/c_fill,q_100,w_555/if_end/dpr_2/v1588693034/clients/103066/a6fcf1778129385c5608c2d23e0d0190597a97e2.jpg",
        category: "sneakers",
        gender: "men",
        description: "Mootag",
        id: "00005",
        sizes: {
          "39": 1,
          "40": 1,
          "41": 1,
          "42": 1,
          "43": 1,
          "44": 1,
          "45": 1,
          "46": 1,
          "47": 1,
          "48": 1,
          "49": 1,
        },
      ),
      ItemModel(
        brand: "OFF WHITE",
        name: "Dokrim's Sneakers",
        price: "500",
        image1:
            "https://cashcow-cdn.azureedge.net/images/810947ce-67a0-4789-a315-edad282bb55d.png",
        category: "sneakers",
        gender: "men",
        description: "Mootag",
        id: "00006",
        sizes: {
          "39": 1,
          "40": 1,
          "41": 1,
          "42": 1,
          "43": 1,
          "44": 1,
          "45": 1,
          "46": 1,
          "47": 1,
          "48": 1,
          "49": 1,
        },
      ),
      ItemModel(
        brand: "OFF WHITE X CONVERCE",
        name: "Normal",
        price: "500",
        image1:
            "https://cashcow-cdn.azureedge.net/images/12c5f875-f228-4a66-881e-792dece4af2f_500.png?v=2",
        category: "sneakers",
        gender: "men",
        description: "Mootag",
        id: "00007",
        sizes: {
          "39": 1,
          "40": 1,
          "41": 1,
          "42": 1,
          "43": 1,
          "44": 1,
          "45": 1,
          "46": 1,
          "47": 1,
          "48": 1,
          "49": 1,
        },
      ),
    ];
    args.products = xxx;
    URL = url
        .toString()
        .replaceAll("https://", "")
        .replaceAll("http://", "")
        .replaceAll("/", "");
    parms = URL.split(".");
    print(parms[0].toString());
    if (parms[0] == "selllit" || parms[0] == "selllit-genius") {
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
      routerDelegate: ProductRouterDelegate(),
      routeInformationParser: ShopRouteInformationParser(),
    );
    return MaterialApp(
      title: parms[0].toString(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClientHomePage(domain: "localhost:49954"),
      routes: {
        '/collection': (BuildContext context) => TemplateView(
              widgets: ShopProductPageStyle2(context),
            ),
      },
      onUnknownRoute: (RouteSettings settings) {
        print("UnknownPage resource");
        return MaterialPageRoute(
          builder: (BuildContext context) => UnknownPage(),
        );
      },
    );
  }
}
