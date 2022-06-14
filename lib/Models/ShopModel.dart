import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';

class ShopModel {
  String shopName;
  String shopID;
  String newsLine;
  String menuType;
  bool menuLogo;
  String shippingPrice;
  String minimumShipping;
  List<ItemModel> items;
  List<dynamic> menu;
  List<dynamic> homeDesign;

  factory ShopModel.fromMap(Map<String, dynamic> map) {
    return ShopModel(
      shopName: map['shopName'],
      newsLine: map["newsLine"],
      menuType: map['menuType'],
      menuLogo: map['menuLogo'],
      shippingPrice: map['shippingPrice'],
      minimumShipping: map['minimumShipping'],
      items: map['items'],
      menu: map['menu'],
      homeDesign: map['homeDesign'],
    );
  }

  factory ShopModel.fromDocument(DocumentSnapshot snap) {
    return ShopModel(
      shopName: snap['shopName'],
      newsLine: snap["newsLine"],
      menuType: snap['menuType'],
      menuLogo: snap['menuLogo'],
      shippingPrice: snap['shippingPrice'],
      minimumShipping: snap['minimumShipping'],
      items: snap['items'],
      menu: snap['menu'],
      homeDesign: snap['homeDesign'],
    );
  }

  ShopModel({
    this.shopName,
    this.newsLine,
    this.menuType,
    this.menuLogo,
    this.shippingPrice,
    this.minimumShipping,
    this.items,
    this.menu,
    this.homeDesign,
  });

  bool update_item(ItemModel item) {
    for (ItemModel model in this.items) {
      if (model.id == item.id) {
        this.items[this.items.indexOf(model)] = item;
        return true;
      }
    }
    return false;
  }
}
