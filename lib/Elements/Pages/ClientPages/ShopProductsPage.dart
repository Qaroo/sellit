import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';
import 'package:pentagonselllit/args.dart' as args;
import '../../../product_route_pth.dart';
import '../../../route.dart';
import '../../ProductsStyles.dart';
import '../../TempView.dart';
import 'ShopProductPage.dart';

Widget FilterTile(BuildContext context, String text) {
  return ListTile(
    title:
        Text(text, style: GoogleFonts.acme(fontSize: 18, color: Colors.black)),
    trailing: Icon(Icons.check_box_outline_blank_outlined, color: Colors.black),
  );
}

//Style 2:
Widget ShopProductPageStyle2(BuildContext context, List<String> tags) {
  print("COllection product:" + args.products.toString());
  List<ItemModel> items_to_show = [];
  for (ItemModel item in args.shopModel.items) {
    bool valid = true;
    if (tags.length > 0) {
      if (item.tags != null) {
        for (String current_tag in tags) {
          if (!item.tags.contains(current_tag)) {
            valid = false;
          }
        }
        if (valid) {
          items_to_show.add(item);
        }
      }
    } else {
      items_to_show.add(item);
    }
  }

  if (MediaQuery.of(context).size.width < MediaQuery.of(context).size.height) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Center(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: (MediaQuery.of(context).size.width * 0.95 / 2) /
                  (MediaQuery.of(context).size.height * 0.5 + 11),
              children: List.generate(
                items_to_show.length,
                (index) => GestureDetector(
                  onTap: () {
                    (Router.of(context).routerDelegate as SellitRouterDelegate)
                        .setNewRoutePath(
                            RoutePath.productPage(items_to_show[index].id));
                  },
                  child: ProductStyle1(
                      items_to_show[index],
                      MediaQuery.of(context).size.height * 0.5,
                      MediaQuery.of(context).size.width * 0.95 / 2,
                      20,
                      context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  return Container(
    width: MediaQuery.of(context).size.width,
    color: Colors.white,
    child: Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Center(
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: (MediaQuery.of(context).size.width * 0.8 / 3) /
                (MediaQuery.of(context).size.height * 0.5 + 11),
            children: List.generate(
              items_to_show.length,
              (index) => ProductStyle1(
                  items_to_show[index],
                  MediaQuery.of(context).size.height * 0.5,
                  MediaQuery.of(context).size.width * 0.8 / 3,
                  20,
                  context),
            ),
          ),
        ),
      ),
    ),
  );
}
