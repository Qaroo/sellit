import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

Widget AssosAppBar(BuildContext context, String from) {
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
                Text(
                  "SHOP NAME",
                  style: GoogleFonts.gidugu(
                      fontSize: 40, color: Color.fromRGBO(50, 50, 50, 1)),
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
                    Scaffold.of(context).openDrawer();
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
              Text(
                "SHOP NAME",
                style: GoogleFonts.gidugu(
                    fontSize: 48, color: Color.fromRGBO(50, 50, 50, 1)),
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
                  Navigator.pushNamed(context, "/");
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
                  Navigator.pushNamed(context, "CollectionPage");
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
