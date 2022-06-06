import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';
import 'package:pentagonselllit/args.dart' as args;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Models/ItemCartModel.dart';
import '../../../product_route_pth.dart';
import '../../../route.dart';
import '../../ProductsStyles.dart';

class ShopProductPage1 extends StatefulWidget {
  ShopProductPage1({Key key, this.productz}) : super(key: key);

  ItemModel productz;
  String selectedSize = "";
  Map<String, dynamic> selectedOptions = {};

  @override
  _ShopProductPage1State createState() => _ShopProductPage1State();
}

class _ShopProductPage1State extends State<ShopProductPage1> {
  @override
  Widget build(BuildContext context) {
    ItemModel product = widget.productz;
    List<Widget> options = [];
    if (product.options != null) {
      for (Map option in product.options) {
        List<dynamic> values = option[option.keys.elementAt(0)];
        String option_name = option.keys.elementAt(0);
        print("option_name: " + option_name);
        options.add(Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            option.keys.elementAt(0),
            style: GoogleFonts.gidugu(
              fontSize: 28,
            ),
            textAlign: TextAlign.left,
          ),
        ));
        options.add(Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 40,
          child: GridView.count(
            crossAxisCount:
                (MediaQuery.of(context).size.width * 0.9 / 100).toInt(),
            childAspectRatio: 100 / 40,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(
              values.length,
              (index) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.selectedOptions[option_name] =
                            values.elementAt(index);
                      });
                    },
                    child: (widget.selectedOptions[option_name] ==
                            values.elementAt(index))
                        ? Container(
                            width: 100,
                            height: 40,
                            color: Color.fromRGBO(245, 245, 245, 1),
                            child: Center(
                              child: Text(
                                values[index],
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                        : Container(
                            width: 100,
                            height: 40,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            child: Center(
                              child: Text(
                                values[index],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ));
              },
            ),
          ),
        ));
        options.add(Container(height: 20));
      }
    }
    List<String> si = [];
    for (String size in ["S", "M", "L"]) {
      si.add(size);
    }
    int inrow = 4;
    List<Widget> page = [];
    page = [
      Container(
        height: 20,
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Text(
          product.name,
          style: GoogleFonts.gidugu(fontSize: 40),
          textAlign: TextAlign.left,
        ),
      ),
      Container(
        color: Colors.black,
        height: 0.5,
        width: MediaQuery.of(context).size.width * 0.9,
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Text(
          product.price + " nis",
          style: GoogleFonts.gidugu(fontSize: 28),
          textAlign: TextAlign.left,
        ),
      ),
      Container(
        color: Colors.black,
        height: 0.5,
        width: MediaQuery.of(context).size.width * 0.9,
      )
    ];
    for (Widget wid in options) {
      page.add(wid);
    }
    page += [
      Column(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.9 - 20,
            color: Colors.black,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  //phone
                  if (widget.selectedSize == "") {
                    Widget okButton = FlatButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    );

                    // set up the AlertDialog
                    AlertDialog alert = AlertDialog(
                      title: Text("Error"),
                      content: Text("No size selected."),
                      actions: [
                        okButton,
                      ],
                    );

                    // show the dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  }
                },
                child: GestureDetector(
                  onTap: () async {
                    if (widget.selectedOptions.keys.length !=
                        product.options.length) {
                      //Alert
                      Widget okButton = TextButton(
                        child: Text("אישור"),
                        onPressed: () {},
                      );

                      // set up the AlertDialog
                      //Change the button color by theme
                      AlertStyle style1 = AlertStyle(
                          animationType: AnimationType.grow,
                          titleStyle: TextStyle(fontWeight: FontWeight.bold));
                      Alert(
                              context: context,
                              title: "שגיאה",
                              desc: "יש לבחור אפשרות אחת מכל קטגוריה",
                              image: Lottie.asset(
                                  "../../../../../../../../../../../../../../../assets/error_animation.json",
                                  repeat: false),
                              buttons: [
                                DialogButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("אישור",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                )
                              ],
                              style: style1)
                          .show();
                    } else {
                      final prefs = await SharedPreferences.getInstance();
                      ItemCartModel model = ItemCartModel(
                          name: product.name,
                          price: product.price,
                          id: product.id,
                          image: product.image1,
                          selected_options: widget.selectedOptions);
                      String string_model = json.encode(model.toMap());
                      List<String> items = prefs.getStringList('cart');
                      if (items == null) {
                        items = [];
                      }
                      items.add(string_model);
                      await prefs.setStringList("cart", items);
                      print("Cart: " + prefs.getStringList("cart").toString());
                      AlertStyle style1 = AlertStyle(
                          animationType: AnimationType.grow,
                          titleStyle: TextStyle(fontWeight: FontWeight.bold));
                      Alert(
                              context: context,
                              title: "אישור",
                              desc: "המוצר נוסף בהצלחה לסל הקניות",
                              image: Lottie.asset(
                                  "../../../../../../../../../../../../../../../assets/cart_animation.json",
                                  repeat: false),
                              buttons: [
                                DialogButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("המשך קניות",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ),
                                DialogButton(
                                  onPressed: () {
                                    (Router.of(context).routerDelegate
                                            as ProductRouterDelegate)
                                        .setNewRoutePath(
                                            ProductRoutePath.cart());
                                  },
                                  child: Text("סיום הזמנה",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                )
                              ],
                              style: style1)
                          .show();
                    }
                  },
                  child: Text(
                    "Add to cart",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      )
    ];

    if (MediaQuery.of(context).size.width < MediaQuery.of(context).size.height)
      return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Column(
                  children: [
                    Image.network(
                      product.image1,
                      width: MediaQuery.of(context).size.width - 20,
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                    Container(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width - 20,
                      child: Column(children: page),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  child: Center(
                    child: Text(
                      "Similar products",
                      style: GoogleFonts.ubuntu(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(
                    product.image1,
                    width: MediaQuery.of(context).size.width * 0.9 / 2 - 15,
                    height: MediaQuery.of(context).size.height * 0.8,
                  ),
                  Container(width: 30),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9 / 2 - 15,
                    child: Column(
                      children: [
                        Container(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9 / 2,
                          child: Text(
                            product.name,
                            style: GoogleFonts.gidugu(fontSize: 40),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          color: Colors.black,
                          height: 0.5,
                          width:
                              MediaQuery.of(context).size.width * 0.9 / 2 - 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9 / 2,
                          child: Text(
                            product.price + " nis",
                            style: GoogleFonts.gidugu(fontSize: 28),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          color: Colors.black,
                          height: 0.5,
                          width:
                              MediaQuery.of(context).size.width * 0.9 / 2 - 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9 / 2,
                          child: Text(
                            "Size",
                            style: GoogleFonts.gidugu(
                              fontSize: 28,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9 / 2,
                          height: 120,
                          child: GridView.count(
                            crossAxisCount: (MediaQuery.of(context).size.width *
                                    0.9 /
                                    2 /
                                    100)
                                .toInt(),
                            childAspectRatio: 100 / 40,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: List.generate(
                              product.sizes.length,
                              (index) {
                                return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.selectedSize = si[index];
                                        print(widget.selectedSize);
                                      });
                                    },
                                    child: (widget.selectedSize == si[index])
                                        ? Container(
                                            width: 100,
                                            height: 40,
                                            color: Color.fromRGBO(
                                                245, 245, 245, 1),
                                            child: Center(
                                              child: Text(
                                                si[index],
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: 100,
                                            height: 40,
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            child: Center(
                                              child: Text(
                                                si[index],
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ));
                              },
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width:
                                  MediaQuery.of(context).size.width * 0.9 / 2 -
                                      20,
                              color: Colors.black,
                              child: GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      //desktop
                                    },
                                    child: Text(
                                      "Add to cart",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 40,
                child: Center(
                  child: Text(
                    "Similar products",
                    style: GoogleFonts.ubuntu(
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: (MediaQuery.of(context).size.width / 4) /
                      (MediaQuery.of(context).size.height * 0.5 + 60),
                  children: List.generate(
                    inrow,
                    (index) => ProductStyle1(
                        args.products[index],
                        MediaQuery.of(context).size.height * 0.5,
                        MediaQuery.of(context).size.width / 4,
                        20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
