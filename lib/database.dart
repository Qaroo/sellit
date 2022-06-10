import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/Models/ShopModel.dart';

import 'Elements/AppBottomBars/AssosBottomBar.dart';
import 'Models/ItemModel.dart';
import 'Models/sidebar/SidebarCategoryConatinerModel.dart';
import 'Models/sidebar/SidebarCategoryImageModel.dart';
import 'Models/sidebar/SidebarCategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/Elements/AppBars/AssosAppBar.dart';
import 'package:pentagonselllit/Elements/AppBottomBars/AssosBottomBar.dart';
import 'package:pentagonselllit/Elements/AppSideBars/NormalSideBar.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pentagonselllit/RowTypes/RowImageModel.dart';
import 'package:pentagonselllit/RowTypes/RowImageSlideShow.dart';
import 'package:pentagonselllit/RowTypes/RowImagesNew.dart';
import 'package:pentagonselllit/RowTypes/RowImagesRow.dart';
import 'package:pentagonselllit/RowTypes/RowImagesWithTextRow.dart';
import 'package:pentagonselllit/RowTypes/RowProductsRowModel.dart';
import 'package:pentagonselllit/RowTypes/RowSpaceModel.dart';
import 'package:pentagonselllit/RowTypes/RowTextModel.dart';
import 'package:pentagonselllit/args.dart' as args;

Future<ItemModel> load_item(String itemID) async {
  return FirebaseFirestore.instance
      .collection("sites")
      .doc(args.shopModel.shopID)
      .collection("items")
      .doc(itemID)
      .get()
      .then((value) {
    ItemModel item = ItemModel.fromMap(value.data());
    bool update = args.shopModel.update_item(item);
    if (!update) {
      return null;
    }
    return item;
  });
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

Future<ShopModel> load_shop(
    BuildContext context, shopID, GlobalKey<ScaffoldState> globalKey) async {
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
        return FirebaseFirestore.instance
            .collection("sites")
            .doc(shopID)
            .collection("customDesign")
            .get()
            .then((snap) {
          List<Widget> now = [];
          now.add(
            Container(
                height: 50,
                color: Color.fromRGBO(235, 235, 235, 1),
                child: Center(
                  child: Text(
                    x.newsLine,
                    style: GoogleFonts.oranienbaum(fontSize: 24),
                  ),
                )),
          );
          now.add(AssosAppBar(globalKey, context, "shophomepage"));
          snap.docs.forEach((element) {
            if (element.data()['type'] == "text") {
              RowTextModel textModel = RowTextModel.fromMap(element.data());
              now.add(textModel.toWidget());
            } else if (element.data()['type'] == "slideshow") {
              RowImageSlideShow textModel =
                  RowImageSlideShow.fromMap(element.data());
              now.add(textModel.toWidget(context));
            } else if (element.data()['type'] == "image") {
              RowImageModel textModel = RowImageModel.fromMap(element.data());
              print("element: " + element.data().toString());
              now.add(textModel.toWidget(context));
            } else if (element.data()['type'] == "space") {
              rowSpaceModel textModel = rowSpaceModel.fromMap(element.data());
              now.add(textModel.toWidget());
            } else if (element.data()['type'] == "imagesrow") {
              rowImagesRow textModel = rowImagesRow.fromMap(element.data());
              now.add(textModel.toWidget(context));
            } else if (element.data()['type'] == "imagewithtext") {
              rowImagesWithTextRow textModel =
                  rowImagesWithTextRow.fromMap(element.data());
              now.add(textModel.toWidget(context));
            } else if (element.data()['type'] == "row") {
              RowImagesRowModel textModel =
                  RowImagesRowModel.fromMap(element.data());
              now.add(textModel.toWidget(context));
            } else if (element.data()['type'] == "items_row") {
              RowProductsRowModel textModel =
                  RowProductsRowModel.fromMap(element.data());
              now.add(textModel.toWidget(context));
            }
          });
          now.add(SizedBox(
            height: 50,
          ));
          now.add(AssosBottomBar(context));
          x.homeDesign = now;
          x.shopID = shopID;
          return x;
        });
      });
    });
  });
}
