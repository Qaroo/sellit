import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/Elements/Pages/ClientCollectionPage.dart';
import 'package:pentagonselllit/Models/sidebar/SidebarCategoryImageModel.dart';
import 'package:pentagonselllit/route.dart';
import 'package:pentagonselllit/args.dart' as args;

import '../../../../Models/sidebar/SidebarCategoryModel.dart';

class sidebar_mobile_style2 {
  Widget getStyle(BuildContext context,
      List<SidebarCategoryImageModel> categories, bool logo) {
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
    for (SidebarCategoryImageModel model in categories) {
      page += [
        Padding(
            padding: EdgeInsets.all(model.padding),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(model.radius),
                child: GestureDetector(
                    onTap: () {
                      args.tapped(context, model.ontap);
                    },
                    child: Image.network(model.url))))
      ];
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
