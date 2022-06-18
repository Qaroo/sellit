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
import 'dart:io';

Widget FilterTile(BuildContext context, String text) {
  return ListTile(
    title:
        Text(text, style: GoogleFonts.acme(fontSize: 18, color: Colors.black)),
    trailing: Icon(Icons.check_box_outline_blank_outlined, color: Colors.black),
  );
}

//Style 2:
Widget ShopProductPageStyle2(BuildContext context, List<String> tags) {
  List<ItemModel> items_to_show = [];
  for (ItemModel item in args.shopModel.items) {
    if (tags.isEmpty) {
      checked_tag = [];
    }
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
    String tags = "";
    double tagHeight = 0;
    for (String tag in checked_tag) {
      tags += "${tag} / ";
    }
    if (!checked_tag.isEmpty) {
      tags = tags.substring(0, tags.length - 2);
      tagHeight = 60;
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: tagHeight,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(tags,
                      style: GoogleFonts.ubuntu(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ))),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  GestureDetector(
                    onTap: () => _filterTapped(context),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 53, 53, 53), width: 0.8),
                      ),
                      width: MediaQuery.of(context).size.width / 2 - 12,
                      height: 40,
                      child: Stack(
                        children: [
                          Positioned(
                            right: 10,
                            child: Container(
                              height: 38,
                              child: Center(
                                child: Text("Filter",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            child: Container(
                              height: 40,
                              child: Center(
                                child: Icon(Icons.filter_alt_outlined),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 53, 53, 53), width: 0.8),
                    ),
                    width: MediaQuery.of(context).size.width / 2 - 12,
                    height: 40,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 10,
                          child: Container(
                            height: 38,
                            child: Center(
                              child: Text("סדר לפי",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          child: Container(
                            height: 40,
                            child: Center(
                              child: Icon(Icons.sort),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            Container(height: 3),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 40,
              color: Colors.white,
              child: Center(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio:
                      (MediaQuery.of(context).size.width * 0.95 / 2) /
                          (MediaQuery.of(context).size.height * 0.37 + 17),
                  children: List.generate(
                    items_to_show.length,
                    (index) => GestureDetector(
                      onTap: () {
                        (Router.of(context).routerDelegate
                                as SellitRouterDelegate)
                            .setNewRoutePath(
                                RoutePath.productPage(items_to_show[index].id));
                      },
                      child: product_card(
                          items_to_show[index],
                          MediaQuery.of(context).size.height * 0.37,
                          MediaQuery.of(context).size.width * 0.95 / 2,
                          context),
                    ),
                  ),
                ),
              ),
            ),
          ],
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
              (index) => product_card(
                  items_to_show[index],
                  MediaQuery.of(context).size.height * 0.5,
                  MediaQuery.of(context).size.width * 0.8 / 3,
                  context),
            ),
          ),
        ),
      ),
    ),
  );
}

List<String> checked_tag = [];

void _filterTapped(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
            builder: (BuildContext context2, StateSetter setState) {
          List<Widget> tiles = [];
          for (String tag in args.shopModel.tags) {
            tiles.add(
              CheckboxListTile(
                title: Text(tag),
                value: checked_tag.contains(tag),
                onChanged: (value) {
                  setState(() {
                    if (value) {
                      checked_tag.add(tag);
                    } else {
                      checked_tag.remove(tag);
                    }
                  });
                },
              ),
            );
          }
          tiles.add(Container(height: 10));
          tiles.add(
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(
                  const Duration(milliseconds: 50),
                  () {
                    (Router.of(context).routerDelegate as SellitRouterDelegate)
                        .setNewRoutePath(RoutePath.collection(checked_tag));
                  },
                );
              },
              child: Container(
                color: Colors.blue,
                width: MediaQuery.of(context).size.width - 20,
                height: 40,
                child: Center(
                  child: Text(
                    "שמור",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          );
          tiles.add(Container(height: 20));

          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: tiles,
              ),
            ),
          );
        });
      });
}
