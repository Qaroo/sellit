import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';

Widget ProductStyle1(
    ItemModel item, double height, double width, double baseFottSize) {
  return Container(
    height: height - 9,
    child: Column(
      children: [
        Image.network(item.image1,
            fit: BoxFit.contain, height: height * 0.75, width: width),
        Container(
            height: height * 0.25,
            width: width,
            child: Column(
              children: [
                Container(height: 10),
                Text(
                  "New Season",
                  style: GoogleFonts.comingSoon(
                      fontSize: baseFottSize - 2, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                Text(
                  item.brand,
                  style: GoogleFonts.acme(
                      fontSize: baseFottSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  item.name,
                  style: GoogleFonts.acme(
                      fontSize: baseFottSize - 2, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ))
      ],
    ),
  );
}
