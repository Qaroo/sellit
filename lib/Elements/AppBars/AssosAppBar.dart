import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/Elements/Pages/ClientHomePage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../product_route_pth.dart';
import '../../route.dart';

Widget AssosAppBar(
    GlobalKey<ScaffoldState> globalKey, BuildContext context, String from) {
  print("From: " + from);
  if (MediaQuery.of(context).size.width <= MediaQuery.of(context).size.height) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Row(
              children: [
                Container(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    print("xyzyz2home");
                    (Router.of(context).routerDelegate as ProductRouterDelegate)
                        .setNewRoutePath(ProductRoutePath.home());
                  },
                  child: Text(
                    "RY SHOPPER",
                    style: GoogleFonts.gidugu(
                        fontSize: 48, color: Color.fromRGBO(50, 50, 50, 1)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 26,
                ),
                Container(
                  width: 5,
                ),
                GestureDetector(
                  child: Icon(
                    Icons.menu,
                    size: 26,
                  ),
                  onTap: () {
                    print("open drawer ");
                    globalKey.currentState.openDrawer();
                  },
                ),
                Container(
                  width: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  return Container(
    height: 80,
    width: MediaQuery.of(context).size.width,
    color: Color.fromRGBO(255, 255, 255, 1),
    child: Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          child: Row(
            children: [
              Container(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  print("xyzyhome");
                  (Router.of(context).routerDelegate as ProductRouterDelegate)
                      .setNewRoutePath(ProductRoutePath.home());
                },
                child: Text(
                  "RY SHOPPER",
                  style: GoogleFonts.gidugu(
                      fontSize: 48, color: Color.fromRGBO(50, 50, 50, 1)),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  (Router.of(context).routerDelegate as ProductRouterDelegate)
                      .setNewRoutePath(ProductRoutePath.home());
                },
                child: Text(
                  "Home",
                  style: GoogleFonts.gidugu(fontSize: 30, color: Colors.black),
                ),
              ),
              Container(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  (Router.of(context).routerDelegate as ProductRouterDelegate)
                      .setNewRoutePath(
                          ProductRoutePath.collection(["shoes", "nike"]));
                },
                child: Text(
                  "Catalog",
                  style: GoogleFonts.gidugu(fontSize: 30, color: Colors.black),
                ),
              ),
              Container(
                width: 20,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Terms of service",
                  style: GoogleFonts.gidugu(fontSize: 30, color: Colors.black),
                ),
              ),
              Container(
                width: 20,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Contact us",
                  style: GoogleFonts.gidugu(fontSize: 30, color: Colors.black),
                ),
              ),
              Container(
                width: 20,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "FAQ",
                  style: GoogleFonts.gidugu(fontSize: 30, color: Colors.black),
                ),
              ),
              Container(
                width: 15,
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
              ),
              Icon(
                Icons.search_outlined,
                size: 26,
              ),
              Container(
                width: 15,
              ),
              Icon(
                Icons.person_outline,
                size: 26,
              ),
              Container(
                width: 15,
              ),
              Icon(
                Icons.shopping_cart_outlined,
                size: 26,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
