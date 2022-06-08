library my_prj.globals;

import 'package:flutter/cupertino.dart';
import 'package:pentagonselllit/product_route_pth.dart';
import 'package:pentagonselllit/route.dart';

import 'Models/ItemModel.dart';
import 'dart:html' as html;

import 'Models/ShopModel.dart';

List<ItemModel> products = [];
List<Widget> HomePage = [];
List<dynamic> Menu = [];
String menuType = "";
bool menuLogo = false;

ItemModel getProduct(String id) {
  for (ItemModel model in products) {
    if (model.id == id) {
      return model;
    }
  }
  return null;
}

String shopID = "";
ShopModel shopModel = null;
tapped(BuildContext context, ontap_val) {
  print("ontapz");
  print("ontapz: " + ontap_val);
  if (ontap_val.contains("url:")) {
    String url = ontap_val.split("url:")[1];
    html.window.open(url, 'new tab');
  } else if (ontap_val.contains("page:")) {
    String page = ontap_val.split(":")[1];
    switch (page) {
      case "collection":
        {
          if (ontap_val.contains("collection:")) {
            List<String> tags = ontap_val.split(":")[2].split(",");
            print("tags: " + tags.toString());
            (Router.of(context).routerDelegate as ProductRouterDelegate)
                .setNewRoutePath(ProductRoutePath.collection(tags));
          } else {
            (Router.of(context).routerDelegate as ProductRouterDelegate)
                .setNewRoutePath(ProductRoutePath.collection([]));
          }
        }
        break;
      case "cart":
        {
          (Router.of(context).routerDelegate as ProductRouterDelegate)
              .setNewRoutePath(ProductRoutePath.cart());
        }
        break;
      case "product":
        {
          String productID = ontap_val.split(":")[2];
          (Router.of(context).routerDelegate as ProductRouterDelegate)
              .setNewRoutePath(ProductRoutePath.details(productID));
        }
        break;
      case "home":
        {
          (Router.of(context).routerDelegate as ProductRouterDelegate)
              .setNewRoutePath(ProductRoutePath.home());
        }
        break;
    }
  }
}
