import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
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
import "dart:html" as html;

class ShopCartPage extends StatefulWidget {
  List<ItemCartModel> cart;
  int shippingPrice, minimumShipping;

  ShopCartPage({Key key, this.cart, this.shippingPrice, this.minimumShipping})
      : super(key: key);

  @override
  _ShopCartPageState createState() => _ShopCartPageState();
}

class _ShopCartPageState extends State<ShopCartPage> {
  Widget card_template(ItemCartModel model) {
    return Container(
      color: Colors.white,
      height: (MediaQuery.of(context).size.height * 0.85) / 4.8,
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
                      ((MediaQuery.of(context).size.height * 0.85) / 4.8) * 0.3,
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
                      ((MediaQuery.of(context).size.height * 0.85) / 4.8) * 0.6,
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
            width: MediaQuery.of(context).size.width * 0.40,
            child: Stack(
              children: [
                Positioned(
                  right: 10,
                  top: 10,
                  child: IconButton(
                      icon: Icon(Icons.more_vert, size: 24),
                      onPressed: () {
                        _item_settingsBottomSheet(context, model);
                      }),
                ),
                Positioned(
                    right: 30,
                    bottom: 15,
                    child: Text("₪" + model.price,
                        style: TextStyle(fontSize: 17))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> templates = [];
    print("Shipping: " + widget.shippingPrice.toString());
    templates.add(Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Text("Shopping Bag (" + widget.cart.length.toString() + ")",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))));

    for (ItemCartModel model in widget.cart) {
      templates.add(card_template(model));
      templates.add(Container(
        color: Colors.grey.shade500,
        height: 1,
        width: MediaQuery.of(context).size.width,
      ));
    }

    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: SingleChildScrollView(
                  child: Column(
                    children: templates,
                  ),
                ),
              ),
              Container(
                  color: Color.fromRGBO(250, 250, 250, 1),
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.4,
                            color: Colors.blue,
                            child: Center(
                                child: Text("מעבר לתשלום",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14))),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 10,
                        child: Text(
                          "עלות פריטים: " +
                              "₪" +
                              get_total(widget.cart).toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Positioned(
                        top: 46,
                        right: 10,
                        child: Text(
                          "עלות משלוח: " +
                              "₪" +
                              get_shipping(widget).toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Positioned(
                        top: 72,
                        right: 10,
                        child: Text(
                          "סך הכל: " +
                              "₪" +
                              (get_shipping(widget) + get_total(widget.cart))
                                  .toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

int get_shipping(ShopCartPage widget) {
  int total = get_total(widget.cart);
  int shipping = widget.shippingPrice;
  int min = widget.minimumShipping;
  if (total > min) {
    shipping = 0;
  }
  return shipping;
}

int get_total(List<ItemCartModel> cart) {
  int total = 0;
  for (ItemCartModel model in cart) {
    total += int.parse(model.price);
  }
  return total;
}

void _item_settingsBottomSheet(BuildContext context, ItemCartModel item) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.33,
            child: Stack(children: [
              Positioned(
                bottom: 18,
                right: 10,
                left: 10,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: GestureDetector(
                      onTap: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        var _items = pref.getStringList('cart');

                        if (_items != null) {
                          for (String current in _items) {
                            Map current_item = json.decode(current);
                            if (current_item["id"] == item.id) {
                              _items.remove(current);

                              pref.setStringList('cart', _items);
                              html.window.location.reload();
                            }
                          }
                          // your widget
                        }
                      },
                      child: Container(
                          height: 40,
                          color: Colors.red,
                          width: MediaQuery.of(context).size.width - 80,
                          child: Center(
                            child: Text("הסר פריט",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          )),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                right: 10,
                left: 10,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                        height: 40,
                        color: Colors.blue,
                        width: MediaQuery.of(context).size.width - 80,
                        child: Center(
                          child: Text("עבור לפריט",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        )),
                  ),
                ),
              ),
            ]));
      });
}
