import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pentagonselllit/Models/ShopModel.dart';

import 'Models/ItemModel.dart';
import 'Models/sidebar/SidebarCategoryConatinerModel.dart';
import 'Models/sidebar/SidebarCategoryImageModel.dart';
import 'Models/sidebar/SidebarCategoryModel.dart';

Future<bool> check_domain(domain) async {
  return FirebaseFirestore.instance
      .collection("domains")
      .doc(domain)
      .get()
      .then((value) {
    return value.data() != null;
  });
}

FutureBuilder loadShop() {}

Future<bool> firstFunc(String uid) async {
  DocumentSnapshot userData =
      await FirebaseFirestore.instance.collection('Users').doc(uid).get();
  bool value = userData["param"];
  return value;
}

Future<String> get_shopID(domain) async {
  return FirebaseFirestore.instance
      .collection("domains")
      .doc(domain)
      .get()
      .then((value) {
    return value.data()["shopID"];
  });
}

Future<ShopModel> load_shop(shopID) async {
  return FirebaseFirestore.instance
      .collection("sites")
      .doc(shopID)
      .get()
      .then((value1) {
    ShopModel x = ShopModel.fromMap(value1.data());
    return FirebaseFirestore.instance
        .collection("sites")
        .doc(shopID)
        .collection("items")
        .get()
        .then((value2) {
      List<ItemModel> items = [];
      value2.docs.forEach((element) {
        items.add(ItemModel.fromMap(element.data()));
      });
      x.items = items;
      return FirebaseFirestore.instance
          .collection("sites")
          .doc(shopID)
          .collection("menu")
          .get()
          .then((value3) {
        List<dynamic> menu = [];

        switch (x.menuType) {
          case "category":
            {
              value3.docs.forEach((element) {
                menu.add(SidebarCategoryModel.fromMap(element.data()));
              });
            }
            break;
          case "image":
            {
              value3.docs.forEach((element) {
                menu.add(SidebarCategoryImageModel.fromMap(element.data()));
              });
            }
            break;
          case "container":
            {
              value3.docs.forEach((element) {
                menu.add(SidebarCategoryContainerModel.fromMap(element.data()));
              });
            }
            break;
        }

        x.menu = menu;
        return x;
      });
    });
  });
}
