import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pentagonselllit/Elements/AppSideBars/Styles/Mobile/sidebar_mobile_style1.dart';
import 'package:pentagonselllit/Elements/AppSideBars/Styles/Mobile/sidebar_mobile_style2.dart';
import 'package:pentagonselllit/Elements/Pages/ClientCollectionPage.dart';
import 'package:pentagonselllit/Models/sidebar/SidebarCategoryConatinerModel.dart';
import 'package:pentagonselllit/Models/sidebar/SidebarCategoryImageModel.dart';
import 'package:pentagonselllit/args.dart';
import 'package:pentagonselllit/route.dart';

import '../../Models/sidebar/SidebarCategoryModel.dart';
import '../../product_route_pth.dart';
import 'Styles/Mobile/sidebar_mobile_style3.dart';
import 'package:pentagonselllit/args.dart' as args;

class NormalSideBar extends StatelessWidget {
  const NormalSideBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (args.menuType == "category") {
      return Drawer(
          child: sidebar_mobile_style1()
              .getStyle(context, args.Menu, args.menuLogo));
    }
    if (args.menuType == "image") {
      return Drawer(
          child: sidebar_mobile_style2()
              .getStyle(context, args.Menu, args.menuLogo));
    }
    if (args.menuType == "container") {
      return Drawer(
          child: sidebar_mobile_style3()
              .getStyle(context, args.Menu, args.menuLogo));
    }
    return Drawer();
  }
}
