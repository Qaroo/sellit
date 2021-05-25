import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

Widget loading_indicator(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    color: Color.fromRGBO(240, 240, 240, 1),
    child: Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Container(
            height: 50,
            width: 50,
            child: LoadingIndicator(
              color: Colors.redAccent[400],
              indicatorType: Indicator.values[16],
            ),
          ),
        ),
      ),
    ),
  );
}
