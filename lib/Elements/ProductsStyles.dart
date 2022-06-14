import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';
import 'package:pentagonselllit/args.dart' as args;

Widget product_card(
    ItemModel item, double height, double width, BuildContext context) {
  return Container(
    height: height,
    width: width,
    child: Column(children: [
      Image.network(
        item.image1,
        height: height * 0.7,
        width: width,
        fit: BoxFit.cover,
      ),
      Container(
        height: height * 0.3,
        width: width,
        child: Column(
          children: [
            Container(
              height: 4,
            ),
            Text(
              item.name,
              style: GoogleFonts.inter(color: Colors.black),
            ),
            Text(
              item.brand + ", " + item.category,
              style:
                  GoogleFonts.inter(color: Color.fromARGB(255, 137, 137, 137)),
            ),
            Container(
              height: 10,
            ),
            Text(
              "₪ " + item.price,
              style: GoogleFonts.inter(color: Colors.black),
            )
          ],
        ),
      ),
    ]),
  );
}

Widget product_row_style(ItemModel item, double height, double width,
    double baseFottSize, BuildContext context) {
  return Container(
    height: height,
    width: width,
    child: GestureDetector(
      onTap: () {
        args.tapped(context, "page:product:" + item.id);
      },
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            child: Image.network(item.image1, height: height * 0.85),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Center(
                child:
                    Text(item.name, style: TextStyle(fontSize: baseFottSize))),
          ),
        ],
      ),
    ),
  );
}
