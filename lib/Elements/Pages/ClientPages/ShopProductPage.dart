import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';
import 'package:pentagonselllit/args.dart';

import '../../ProductsStyles.dart';

//Style 1:
Widget ProductPageStyle1(BuildContext context, ItemModel product) {
  print("Product: " + product.toString());
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
                                (MediaQuery.of(context).size.width * 0.9 / 100)
                                    .toInt(),
                            childAspectRatio: 100 / 40,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children:
                                List.generate(product.sizes.length, (index) {
                              return Container(
                                  width: 100,
                                  height: 40,
                                  color: Color.fromRGBO(30, 30, 30, 1),
                                  child: Center(
                                    child: Text(
                                      si[index],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ));
                            }),
                          ),
                        ),
                        Container(height: 20),
                        Column(
                          children: [
                            Container(
                              height: 50,
                              width:
                                  MediaQuery.of(context).size.width * 0.9 - 20,
                              color: Colors.black,
                              child: Center(
                                child: Text("Add to cart",
                                    style: TextStyle(color: Colors.white)),
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
                        width: MediaQuery.of(context).size.width * 0.9 / 2 - 15,
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
                        width: MediaQuery.of(context).size.width * 0.9 / 2 - 15,
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
                          children:
                              List.generate(product.sizes.length, (index) {
                            return Container(
                                width: 100,
                                height: 40,
                                color: Color.fromRGBO(30, 30, 30, 1),
                                child: Center(
                                  child: Text(
                                    si[index],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ));
                          }),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.9 / 2 -
                                20,
                            color: Colors.black,
                            child: Center(
                              child: Text("Add to cart",
                                  style: TextStyle(color: Colors.white)),
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
