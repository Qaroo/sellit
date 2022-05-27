import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowImagesRowModel {
  double height;
  double width;
  String type;
  double radius;
  List<dynamic> images;

  RowImagesRowModel(
      {this.height, this.type, this.radius, this.images, this.width});

  factory RowImagesRowModel.fromMap(Map<String, dynamic> map) {
    return RowImagesRowModel(
      height: map["height"],
      type: map["type"],
      radius: map["radius"],
      images: map["images"],
      width: map["width"],
    );
  }

  Widget buildCard(BuildContext context, Map<dynamic, dynamic> xoxo) {
    Size size = MediaQuery.of(context).size;
    if (this.height < 1) {
      this.height = this.height * size.height;
    }
    if (this.width < 1) {
      this.width = this.width * size.width;
    }
    return Container(
      width: this.width,
      height: this.height,
      child: Column(
        children: [
          ClipRRect(
            child: Image.network(
              xoxo["src"],
              height: this.height - 40,
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(this.radius),
          ),
          SizedBox(
            height: 20,
          ),
          Text(xoxo["text"])
        ],
      ),
    );
  }

  Widget toWidget(BuildContext context) {
    List<Widget> cards = [];
    cards.add(SizedBox(
      width: 12,
    ));
    for (int i = 0; i < this.images.length; i++) {
      cards.add(buildCard(context, this.images[i]));
      cards.add(SizedBox(
        width: 12,
      ));
    }
    return Container(
      height: this.height,
      child: ListView(scrollDirection: Axis.horizontal, children: cards),
    );
  }
}
