import 'package:flutter/material.dart';

Widget appbar1(BuildContext context) {
  return PreferredSize(
    preferredSize: Size(double.infinity, 100),
    child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 2)
      ]),
      width: MediaQuery.of(context).size.width / 2,
      height: 60,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.navigate_before,
                size: 40,
                color: Colors.black,
              ),
              Text(
                "Shop",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              Icon(
                Icons.navigate_before,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
