import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/Elements/AppBars/AssosAppBar.dart';
import 'package:pentagonselllit/Elements/AppBottomBars/AssosBottomBar.dart';
import 'package:pentagonselllit/Elements/AppSideBars/NormalSideBar.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pentagonselllit/RowTypes/RowImageModel.dart';
import 'package:pentagonselllit/RowTypes/RowImageSlideShow.dart';
import 'package:pentagonselllit/RowTypes/RowImagesNew.dart';
import 'package:pentagonselllit/RowTypes/RowImagesRow.dart';
import 'package:pentagonselllit/RowTypes/RowImagesWithTextRow.dart';
import 'package:pentagonselllit/RowTypes/RowProductsRowModel.dart';
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
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Future<QuerySnapshot> snapshot = FirebaseFirestore.instance
        .collection("sites")
        .document(widget.shopID)
        .collection("customDesign")
        .getDocuments();

    Stream<DocumentSnapshot> snapshot2 = FirebaseFirestore.instance
        .collection("sites")
        .document(widget.shopID)
        .snapshots();

    String newsLine = "News line - Type whatever you want";

    snapshot2.listen((event) {
      if (event.data().containsKey("newsLine")) {
        if (event.data()["newsLine"] != null) {
          setState(() {
            newsLine = event.data()["newsLine"];
          });
        }
      }
    });

    if (!loadTheme) {
      List<ItemModel> xxx = [];
      Future<QuerySnapshot> snapshot3 = FirebaseFirestore.instance
          .collection("sites")
          .document("check")
          .collection("items")
          .getDocuments();
      snapshot3.then((snap) {
        print("Shot: " + snap.toString());
        snap.docs.forEach((element) {
          print("Data: " + element.data().toString());
          xxx.add(ItemModel.fromMap(element.data()));
        });
        //args.products = xxx;

        snapshot.then((snap) {
          List<Widget> now = [];
          now.add(
            Container(
                height: 50,
                color: Color.fromRGBO(235, 235, 235, 1),
                child: Center(
                  child: Text(
                    newsLine,
                    style: GoogleFonts.oranienbaum(fontSize: 24),
                  ),
                )),
          );
          now.add(AssosAppBar(globalKey, context, "shophomepage"));
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
            } else if (element.data()['type'] == "row") {
              RowImagesRowModel textModel =
                  RowImagesRowModel.fromMap(element.data());
              now.add(textModel.toWidget(context));
            } else if (element.data()['type'] == "items_row") {
              RowProductsRowModel textModel =
                  RowProductsRowModel.fromMap(element.data());
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
      });
    }
    return new WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        key: globalKey,
        drawer: NormalSideBar(),
        body: Builder(
          builder: (context) => Container(
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
      ),
    );
  }
}
