import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowTextModel {
  String text;
  double fontSize;
  String style;
  String align;
  String padding;
  String textColor;
  String font;

  RowTextModel(
      {this.text,
      this.fontSize,
      this.style,
      this.align,
      this.padding,
      this.textColor,
      this.font});

  factory RowTextModel.fromMap(Map<String, dynamic> map) {
    return RowTextModel(
      text: map["text"],
      fontSize: map["fontSize"],
      style: map["style"],
      align: map["align"],
      padding: map["padding"],
      textColor: map["textColor"],
      font: map["font"],
    );
  }

  Widget toWidget(BuildContext context) {
    List<String> paddings = padding.split(",");
    double leftPadding = double.parse(paddings[0]);
    double topPadding = double.parse(paddings[1]);
    double rightPadding = double.parse(paddings[2]);
    double bottomPadding = double.parse(paddings[3]);

    return Padding(
      padding: EdgeInsets.fromLTRB(
          leftPadding, topPadding, rightPadding, bottomPadding),
      child: Text(text,
          style: GoogleFonts.ubuntu(
            fontSize: fontSize,
            color: Color.fromRGBO(
              int.parse(textColor.split(",")[0]),
              int.parse(textColor.split(",")[1]),
              int.parse(textColor.split(",")[2]),
              double.parse(textColor.split(",")[3]),
            ),
          ),
          textAlign: TextAlign.center),
    );
  }
}
