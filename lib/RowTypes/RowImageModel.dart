import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/args.dart' as args;

class RowImageModel {
  double height;
  double width;
  String type;
  double radius;
  String image;
  String fit;
  String padding;
  Map<String, dynamic> texts;
  String ontap;

  RowImageModel(
      {this.height,
      this.padding,
      this.type,
      this.radius,
      this.image,
      this.fit,
      this.texts,
      this.width,
      this.ontap});

  factory RowImageModel.fromMap(Map<String, dynamic> map) {
    return RowImageModel(
      height: map["height"],
      padding: map["padding"],
      type: map["type"],
      radius: map["radius"],
      image: map["image"],
      fit: map["fit"],
      ontap: map["ontap"],
      texts: map["texts"],
      width: map["width"],
    );
  }

  Widget toWidget(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BoxFit fit = BoxFit.cover;
    List<String> paddings = padding.split(",");
    double leftPadding = double.parse(paddings[0]);
    double topPadding = double.parse(paddings[1]);
    double rightPadding = double.parse(paddings[2]);
    double bottomPadding = double.parse(paddings[3]);
    if (fit == "contain") {
      fit = BoxFit.contain;
    } else if (fit == "fill") {
      fit = BoxFit.fill;
    } else if (fit == "cover") {
      fit = BoxFit.cover;
    }
    var heightIMAGE = height;
    if (0 < height && height <= 1) {
      heightIMAGE = MediaQuery.of(context).size.height * height;
    }
    List<Widget> textsWidgets;
    if (width == 0) {
      textsWidgets = [
        Image.network(
          image,
          fit: fit,
          height: heightIMAGE,
        )
      ];
    } else if (0 < width && width <= 1) {
      textsWidgets = [
        GestureDetector(
          onTap: () {
            args.tapped(context, ontap);
          },
          child: Image.network(
            image,
            fit: fit,
            height: heightIMAGE,
            width: MediaQuery.of(context).size.width * width,
          ),
        )
      ];
    } else {
      textsWidgets = [
        GestureDetector(
          onTap: () {
            args.tapped(context, ontap);
          },
          child: Image.network(
            image,
            fit: fit,
            height: heightIMAGE,
            width: width,
          ),
        )
      ];
    }

    if (texts != null) {
      for (String text in texts.keys) {
        List<String> textPadding = texts[text]["padding"].toString().split(",");
        double textleftPadding = double.parse(textPadding[0]);
        double texttopPadding = double.parse(textPadding[1]);
        double textrightPadding = double.parse(textPadding[2]);
        double textbottomPadding = double.parse(textPadding[3]);
        if (textleftPadding == -1) textleftPadding = null;
        if (texttopPadding == -1) texttopPadding = null;
        if (textrightPadding == -1) textrightPadding = null;
        if (textbottomPadding == -1) textbottomPadding = null;
        if (texts[text]["center"] == null) {
          textsWidgets.add(
            Positioned(
              bottom: textbottomPadding,
              top: texttopPadding,
              right: textrightPadding,
              left: textleftPadding,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: texts[text]["fontSize"])),
              ),
            ),
          );
        } else if (texts[text]["center"] == true) {
          textsWidgets.add(
            Positioned(
              bottom: textbottomPadding,
              top: texttopPadding,
              right: textrightPadding,
              left: textleftPadding,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    texts[text]["font"],
                    color: Colors.white,
                    fontSize: double.parse(texts[text]["fontSize"].toString()),
                  ),
                ),
              ),
            ),
          );
        }
      }
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(
          leftPadding, topPadding, rightPadding, bottomPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Stack(children: textsWidgets),
      ),
    );
  }
}
