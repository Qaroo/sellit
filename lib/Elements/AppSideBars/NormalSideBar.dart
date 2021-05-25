import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NormalSideBar extends StatelessWidget {
  const NormalSideBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text("Gmail"),
        ),
        Divider(color: Colors.grey.shade400),
        ListTile(title: Text("All inboxes"))
      ],
    ));
  }
}
