import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';
import 'package:pentagonselllit/args.dart' as args;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Models/ItemCartModel.dart';
import '../../ProductsStyles.dart';

class ShopCartPage extends StatefulWidget {
  List<ItemCartModel> cart;
  ShopCartPage({Key key, this.cart}) : super(key: key);

  @override
  _ShopCartPageState createState() => _ShopCartPageState();
}

class _ShopCartPageState extends State<ShopCartPage> {
  Widget card_template(ItemCartModel model) {
    return Container(
      color: Colors.white,
      height: (MediaQuery.of(context).size.height * 0.85) / 2.8,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Image.network(model.image),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              children: [
                Container(
                  height:
                      ((MediaQuery.of(context).size.height * 0.85) / 2.8) * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      model.name,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  height:
                      ((MediaQuery.of(context).size.height * 0.85) / 2.8) * 0.6,
                  child: Flexible(
                      child: Text(
                    model.get_dotted(),
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 68, 66, 66)),
                  )),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.36,
            child: Stack(
              children: [
                Positioned(right: 10, top: 20, child: Text("Do what you want."))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.85,
                child: Column(
                  children: [card_template(widget.cart[0])],
                ),
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
