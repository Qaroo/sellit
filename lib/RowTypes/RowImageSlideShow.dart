import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import '../args.dart' as args;
import '../product_route_pth.dart';
import '../route.dart';

class RowImageSlideShow {
  double height;
  double width;
  String type;
  double radius;
  List<dynamic> image;
  String fit;
  String padding;
  Map<String, dynamic> texts;
  Map<String, dynamic> ontap;
  int pageValue = 0;

  RowImageSlideShow(
      {this.height,
      this.padding,
      this.type,
      this.radius,
      this.image,
      this.fit,
      this.texts,
      this.width,
      this.ontap});

  factory RowImageSlideShow.fromMap(Map<String, dynamic> map) {
    return RowImageSlideShow(
      height: map["height"],
      padding: map["padding"],
      type: map["type"],
      radius: map["radius"],
      image: map["images"],
      fit: map["fit"],
      texts: map["texts"],
      width: map["width"],
      ontap: map["ontap"],
    );
  }
  factory RowImageSlideShow.fromMap2(Map<String, dynamic> map) {
    return RowImageSlideShow(
      height: map["height"],
      padding: map["padding"],
      type: map["type"],
      radius: map["radius"],
      image: map["images"],
      fit: map["fit"],
      width: map["width"],
      ontap: map["ontap"],
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
    List<Widget> images = [];
    for (String im in image) {
      images.add(Image.network(im, fit: fit));
    }
    if (width == 0) {
      textsWidgets = [
        GestureDetector(
          onTap: () {
            print("should go to ...");
            args.tapped(context, ontap["$pageValue"]);
            print("Page: " + pageValue.toString());
          },
          child: ImageSlideshow(
            height: heightIMAGE,
            initialPage: 0,
            indicatorColor: Colors.white,
            indicatorBackgroundColor: Colors.grey,
            children: images,
            onPageChanged: (value) {
              print('Page changed: $value');
              pageValue = value;
            },
            autoPlayInterval: 10000,
          ),
        ),
      ];
    } else if (0 < width && width <= 1) {
      textsWidgets = [
        GestureDetector(
          onTap: () {
            print("should go to ... $context");
            args.tapped(context, ontap["$pageValue"]);
            print("Page: " + pageValue.toString());
          },
          child: ImageSlideshow(
            width: MediaQuery.of(context).size.width * width,
            height: heightIMAGE,
            initialPage: 0,
            indicatorColor: Colors.white,
            indicatorBackgroundColor: Colors.grey,
            children: images,
            onPageChanged: (value) {
              print('Page changed: $value');
              pageValue = value;
            },
            autoPlayInterval: 10000,
          ),
        ),
      ];
    } else {
      textsWidgets = [
        GestureDetector(
          onTap: () {
            args.tapped(context, ontap["$pageValue"]);
            print("Page: " + pageValue.toString());
          },
          child: ImageSlideshow(
            width: width,
            height: heightIMAGE,
            initialPage: 0,
            indicatorColor: Colors.white,
            indicatorBackgroundColor: Colors.grey,
            children: images,
            onPageChanged: (value) {
              print('Page changed: $value');
              pageValue = value;
            },
            autoPlayInterval: 10000,
          ),
        ),
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
