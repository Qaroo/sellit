import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pentagonselllit/Elements/AppSideBars/Styles/Mobile/sidebar_mobile_style1.dart';
import 'package:pentagonselllit/Elements/Pages/ClientCollectionPage.dart';
import 'package:pentagonselllit/route.dart';

import '../../Models/sidebar/SidebarCategoryModel.dart';
import '../../product_route_pth.dart';

class NormalSideBar extends StatelessWidget {
  const NormalSideBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SidebarCategoryModel> name = [];
    name.add(SidebarCategoryModel.fromMap(
        {"title": "Orin", "ontap": "x", "childs": null}));
    name.add(SidebarCategoryModel.fromMap({
      "title": "Nir",
      "ontap": "x",
      "childs": [
        SidebarCategoryModel.fromMap({
          "title": "Ruti",
          "ontap": "x",
          "childs": [
            SidebarCategoryModel.fromMap(
                {"title": "Ilay", "ontap": "x", "childs": null})
          ]
        }),
        SidebarCategoryModel.fromMap(
            {"title": "Mishel", "ontap": "x", "childs": null})
      ]
    }));
    name.add(SidebarCategoryModel.fromMap(
        {"title": "Ilay", "ontap": "x", "childs": null}));

    return Drawer(child: sidebar_mobile_style1().getStyle(name, true));
  }
}
