import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';
import 'package:pentagonselllit/args.dart' as args;

import '../../ProductsStyles.dart';

class ShopProductPage1 extends StatefulWidget {
  ShopProductPage1({Key key, this.productz}) : super(key: key);

  ItemModel productz;
  String selectedSize = "";

  @override
  _ShopProductPage1State createState() => _ShopProductPage1State();
}

class _ShopProductPage1State extends State<ShopProductPage1> {
  @override
  Widget build(BuildContext context) {
    ItemModel product = widget.productz;
    List<String> si = [];
    for (String size in product.sizes.keys) {
      si.add(size);
    }
    int inrow = 4;
    if (args.products.length < 4) inrow = args.products.length;
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
                      child: Column(
                        children: [
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
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Text(
                              "Size",
                              style: GoogleFonts.gidugu(
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 150,
                            child: GridView.count(
                              crossAxisCount:
                                  (MediaQuery.of(context).size.width *
                                          0.9 /
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
                          Container(height: 20),
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.9 -
                                    20,
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
                                    child: Text("Add to cart",
                                        style: TextStyle(color: Colors.white)),
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
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: (MediaQuery.of(context).size.width / 2) /
                        (MediaQuery.of(context).size.height * 0.4 + 60),
                    physics: new NeverScrollableScrollPhysics(),
                    children: List.generate(
                      inrow,
                      (index) => ProductStyle1(
                          args.products[index],
                          MediaQuery.of(context).size.height * 0.4,
                          MediaQuery.of(context).size.width / 2,
                          20),
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
