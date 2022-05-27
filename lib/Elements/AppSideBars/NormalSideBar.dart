import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pentagonselllit/Elements/Pages/ClientCollectionPage.dart';
import 'package:pentagonselllit/route.dart';

import '../../product_route_pth.dart';

class NormalSideBar extends StatelessWidget {
  const NormalSideBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text("RY SHOPPER"),
        ),
        Divider(color: Colors.grey.shade400),
        ListTile(title: Text("All inboxes")),
        GestureDetector(
          onTap: () {
            (Router.of(context).routerDelegate as ProductRouterDelegate)
                .setNewRoutePath(ProductRoutePath.collection());
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text("Collection"),
          ),
        ),
      ],
    ));
  }
}
