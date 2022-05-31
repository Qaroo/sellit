import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pentagonselllit/Elements/AppSideBars/Styles/Mobile/sidebar_mobile_style1.dart';
import 'package:pentagonselllit/Elements/AppSideBars/Styles/Mobile/sidebar_mobile_style2.dart';
import 'package:pentagonselllit/Elements/Pages/ClientCollectionPage.dart';
import 'package:pentagonselllit/Models/sidebar/SidebarCategoryConatinerModel.dart';
import 'package:pentagonselllit/Models/sidebar/SidebarCategoryImageModel.dart';
import 'package:pentagonselllit/route.dart';

import '../../Models/sidebar/SidebarCategoryModel.dart';
import '../../product_route_pth.dart';
import 'Styles/Mobile/sidebar_mobile_style3.dart';

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

    List<SidebarCategoryImageModel> names = [];
    names.add(SidebarCategoryImageModel(
        padding: 8,
        radius: 10,
        url:
            "https://cdn.shopify.com/s/files/1/0619/2175/5367/files/RY-224.jpg?v=1649162640&width=1000"));
    names.add(SidebarCategoryImageModel(
        padding: 8,
        radius: 10,
        url:
            "https://cdn.shopify.com/s/files/1/0619/2175/5367/files/RY-181.jpg?v=1649162427&width=1000"));

    List<SidebarCategoryContainerModel> names2 = [];
    names2.add(SidebarCategoryContainerModel(
        padding: 8,
        radius: 0,
        height: 80,
        bgColor: "10,10,10,1",
        textColor: "255,255,255,1",
        textPadding: "10,10,-1,-1",
        imagePadding: "-1,-1,10,0",
        text: "GET READY FOR US",
        icon: ""));
    return Drawer(child: sidebar_mobile_style3().getStyle(names2, true));
  }
}
