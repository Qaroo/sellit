import 'package:flutter/material.dart';

class rowSpaceModel {
  double height;

  rowSpaceModel({this.height});

  factory rowSpaceModel.fromMap(Map<String, dynamic> map) {
    return rowSpaceModel(
      height: map['height'],
    );
  }

  Widget toWidget() {
    return SizedBox(
      height: height,
    );
  }
}
