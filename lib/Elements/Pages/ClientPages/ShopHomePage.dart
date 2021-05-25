import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/Elements/AppBars/AssosAppBar.dart';
import 'package:pentagonselllit/Elements/AppBottomBars/AssosBottomBar.dart';
import 'package:pentagonselllit/Elements/AppSideBars/NormalSideBar.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pentagonselllit/RowTypes/RowImageModel.dart';
import 'package:pentagonselllit/RowTypes/RowImageSlideShow.dart';
import 'package:pentagonselllit/RowTypes/RowImagesRow.dart';
import 'package:pentagonselllit/RowTypes/RowImagesWithTextRow.dart';
import 'package:pentagonselllit/RowTypes/RowSpaceModel.dart';
import 'package:pentagonselllit/RowTypes/RowTextModel.dart';
import 'package:pentagonselllit/args.dart';

class ShopHomePage extends StatefulWidget {
  String shopID;
  ShopHomePage({this.shopID, Key key}) : super(key: key);

  @override
  _ShopHomePageState createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
  bool finishLoad = false;
  bool hasShop;
  bool loadTheme = false;
  List<ItemModel> items = [];
  List<Widget> widgets = [];
  @override
  Widget build(BuildContext context) {
    Future<QuerySnapshot> snapshot = FirebaseFirestore.instance
        .collection("sites")
        .document(widget.shopID)
        .collection("customDesign")
        .getDocuments();

    if (!loadTheme) {
      snapshot.then((snap) {
        List<Widget> now = [];
        now.add(
          Container(
              height: 50,
              color: Color.fromRGBO(235, 235, 235, 1),
              child: Center(
                child: Text(
                  "News line - Type whatever you want",
                  style: GoogleFonts.oranienbaum(fontSize: 24),
                ),
              )),
        );
        now.add(AssosAppBar(context, "shophomepage"));
        snap.docs.forEach((element) {
          if (element.data()['type'] == "text") {
            RowTextModel textModel = RowTextModel.fromMap(element.data());
            now.add(textModel.toWidget());
          } else if (element.data()['type'] == "slideshow") {
            RowImageSlideShow textModel =
                RowImageSlideShow.fromMap(element.data());
            now.add(textModel.toWidget(context));
          } else if (element.data()['type'] == "image") {
            RowImageModel textModel = RowImageModel.fromMap(element.data());
            print("element: " + element.data().toString());
            now.add(textModel.toWidget(context));
          } else if (element.data()['type'] == "space") {
            rowSpaceModel textModel = rowSpaceModel.fromMap(element.data());
            now.add(textModel.toWidget());
          } else if (element.data()['type'] == "imagesrow") {
            rowImagesRow textModel = rowImagesRow.fromMap(element.data());
            now.add(textModel.toWidget(context));
          } else if (element.data()['type'] == "imagewithtext") {
            rowImagesWithTextRow textModel =
                rowImagesWithTextRow.fromMap(element.data());
            now.add(textModel.toWidget(context));
          }
        });
        now.add(SizedBox(
          height: 50,
        ));
        now.add(AssosBottomBar(context));
        setState(() {
          widgets = now;
          loadTheme = true;
        });
      });
    }

    return Scaffold(
      drawer: NormalSideBar(),
      body: Builder(
        builder: (context2) => Container(
          color: Colors.white,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: widgets,
            ),
          ),
        ),
      ),
    );
  }
}
