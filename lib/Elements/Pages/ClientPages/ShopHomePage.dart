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
import 'package:pentagonselllit/args.dart' as args;

class ShopHomePage extends StatefulWidget {
  String shopID;
  GlobalKey<ScaffoldState> globalKey;
  ShopHomePage({Key key, this.globalKey}) : super(key: key);

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
    return new WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        key: widget.globalKey,
        drawer: NormalSideBar(),
        body: Builder(
          builder: (context) => Container(
            color: Colors.white,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: args.shopModel.homeDesign,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
