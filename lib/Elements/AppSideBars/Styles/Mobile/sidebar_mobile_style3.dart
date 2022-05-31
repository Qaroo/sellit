import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentagonselllit/Elements/Pages/ClientCollectionPage.dart';
import 'package:pentagonselllit/Models/sidebar/SidebarCategoryConatinerModel.dart';
import 'package:pentagonselllit/Models/sidebar/SidebarCategoryImageModel.dart';
import 'package:pentagonselllit/route.dart';

import '../../../../Models/sidebar/SidebarCategoryModel.dart';

class sidebar_mobile_style3 {
  //This is a "banners" style, container instead of text.

  action(String ontap) {}

  Widget getStyle(List<SidebarCategoryContainerModel> categories, bool logo) {
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
    for (SidebarCategoryContainerModel model in categories) {
      List<String> textpaddings = model.textPadding.split(",");
      double text_leftPadding = double.parse(textpaddings[0]);
      double text_topPadding = double.parse(textpaddings[1]);
      double text_rightPadding = double.parse(textpaddings[2]);
      double text_bottomPadding = double.parse(textpaddings[3]);
      if (text_leftPadding == -1) text_leftPadding = null;
      if (text_topPadding == -1) text_topPadding = null;
      if (text_rightPadding == -1) text_rightPadding = null;
      if (text_bottomPadding == -1) text_bottomPadding = null;

      List<String> iconpaddings = model.textPadding.split(",");
      double icon_leftPadding = double.parse(iconpaddings[0]);
      double icon_topPadding = double.parse(iconpaddings[1]);
      double icon_rightPadding = double.parse(iconpaddings[2]);
      double icon_bottomPadding = double.parse(iconpaddings[3]);
      if (icon_leftPadding == -1) icon_leftPadding = null;
      if (icon_topPadding == -1) icon_topPadding = null;
      if (icon_rightPadding == -1) icon_rightPadding = null;
      if (icon_bottomPadding == -1) icon_bottomPadding = null;

      page += [
        Padding(
          padding: EdgeInsets.all(model.padding),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(model.radius),
            child: Container(
              color: Color.fromRGBO(
                int.parse(model.bgColor.split(",")[0]),
                int.parse(model.bgColor.split(",")[1]),
                int.parse(model.bgColor.split(",")[2]),
                double.parse(model.bgColor.split(",")[3]),
              ),
              height: model.height,
              child: Stack(
                children: [
                  Positioned(
                    top: text_topPadding,
                    right: text_rightPadding,
                    left: text_leftPadding,
                    bottom: text_bottomPadding,
                    child: Text(model.text,
                        style: GoogleFonts.ubuntu(
                          fontSize: model.fontSize,
                          color: Color.fromRGBO(
                            int.parse(model.textColor.split(",")[0]),
                            int.parse(model.textColor.split(",")[1]),
                            int.parse(model.textColor.split(",")[2]),
                            double.parse(model.textColor.split(",")[3]),
                          ),
                        ),
                        textAlign: TextAlign.center),
                  ),
                  Positioned(
                    top: icon_topPadding,
                    right: icon_rightPadding,
                    left: icon_leftPadding,
                    bottom: icon_bottomPadding,
                    child: Image.network(
                      model.icon,
                      height: model.height,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
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
