import 'package:flutter/material.dart';

class rowSpaceModel {
  double height;
  double width;

  rowSpaceModel({this.height, this.width});

  factory rowSpaceModel.fromMap(Map<String, dynamic> map) {
    return rowSpaceModel(
      height: map['height'],
      width: map['width'],
    );
  }

  Widget toWidget() {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
