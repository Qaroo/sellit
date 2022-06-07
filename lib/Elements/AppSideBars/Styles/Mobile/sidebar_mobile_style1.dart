import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/Elements/Pages/ClientCollectionPage.dart';
import 'package:pentagonselllit/route.dart';
import 'package:pentagonselllit/args.dart' as args;

import '../../../../Models/sidebar/SidebarCategoryModel.dart';

class sidebar_mobile_style1 {
  //This is a noraml style, Lines, childs

  action(String ontap) {}

  List<Widget> getRow(BuildContext context, SidebarCategoryModel category) {
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
              onTap: () {
                args.tapped(context, category.ontap);
              },
            ),
          ),
        )
      ];
    } else {
      List<Widget> subsub = [];

      for (SidebarCategoryModel subcategory in category.childs) {
        subsub += getRow(context, subcategory);
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

  Widget getStyle(
      BuildContext context, List<SidebarCategoryModel> categories, bool logo) {
    List<Widget> page = [];
    if (logo == true) {
      page += [
        Padding(
          padding: EdgeInsets.all(8),
          child: Image.network(
            "https://upload.wikimedia.org/wikipedia/en/thumb/7/76/Wix.com_website_logo.svg/2560px-Wix.com_website_logo.svg.png",
            width: 20,
            height: 20,
          ),
        ),
        Divider(
          color: Colors.grey.shade400,
          thickness: 1.0,
        ),
      ];
    } else {
      page += [
        Padding(
          padding: EdgeInsets.all(8),
          child: Text("SITE NAME"),
        ),
        Divider(
          color: Colors.grey.shade400,
          thickness: 1.0,
        ),
      ];
    }

    for (SidebarCategoryModel category in categories) {
      page += getRow(context, category);
    }
    page.add(
      Divider(
        color: Colors.grey.shade400,
        thickness: 1.0,
      ),
    );
    return ListView(
      children: page,
    );
  }
  //
}
