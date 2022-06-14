import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';
import 'package:pentagonselllit/args.dart' as args;
import 'package:pentagonselllit/Elements/ProductsStyles.dart';

class RowProductsRowModel {
  double height;
  double width;
  String type;
  String style;
  List<dynamic> products;

  RowProductsRowModel(
      {this.height, this.type, this.products, this.width, this.style});

  factory RowProductsRowModel.fromMap(Map<String, dynamic> map) {
    return RowProductsRowModel(
      height: map["height"],
      type: map["type"],
      products: map["items"],
      width: map["width"],
      style: map["style"],
    );
  }

  Widget toWidget(BuildContext context) {
    List<ItemModel> items = [];
    for (ItemModel item in args.shopModel.items) {
      if (products.contains(item.id)) {
        items.add(item);
      }
    }
    List<Widget> widgets = [];
    if (height <= 1) {
      height = MediaQuery.of(context).size.height * height;
    }
    if (width <= 1) {
      width = MediaQuery.of(context).size.width * width;
    }
    widgets.add(SizedBox(
      width: 10,
    ));
    for (ItemModel item in items) {
      widgets.add(product_row_style(item, height, width, 16, context));
      widgets.add(SizedBox(
        width: 10,
      ));
    }

    return Container(
      height: this.height,
      child: ListView(scrollDirection: Axis.horizontal, children: widgets),
    );
  }
}
