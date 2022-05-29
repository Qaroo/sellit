import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/Elements/Pages/ClientCollectionPage.dart';
import 'package:pentagonselllit/route.dart';

import '../../../../Models/sidebar/SidebarCategoryModel.dart';

class sidebar_mobile_style1 {
  //

  action(String ontap) {}

  List<Widget> getRow(SidebarCategoryModel category) {
    if (category.childs == null) {
      return [
        GestureDetector(
          onTap: () {
            action(category.ontap);
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              title:
                  Text(category.title, style: GoogleFonts.inter(fontSize: 18)),
            ),
          ),
        )
      ];
    } else {
      List<Widget> subsub = [];

      for (SidebarCategoryModel subcategory in category.childs) {
        subsub += getRow(subcategory);
      }
      Widget listile = Padding(
          padding: EdgeInsets.all(8),
          child: ExpansionTile(
            title: Text(category.title, style: GoogleFonts.inter(fontSize: 18)),
            children: subsub,
          ));

      return [listile];
    }
  }

  Widget getStyle(List<SidebarCategoryModel> categories) {
    List<Widget> page = [];
    page += [
      Padding(
        padding: EdgeInsets.all(16),
        child: Text("SITE NAME"),
      ),
      Divider(color: Colors.black),
    ];
    print("Catt");
    for (SidebarCategoryModel category in categories) {
      page += getRow(category);
    }
    return ListView(
      children: page,
    );
  }
  //
}
