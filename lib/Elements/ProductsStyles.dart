import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';
import 'package:pentagonselllit/args.dart' as args;

Widget ProductStyle1(ItemModel item, double height, double width,
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
