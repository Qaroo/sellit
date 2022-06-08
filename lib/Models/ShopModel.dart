import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pentagonselllit/Models/ItemModel.dart';

class ShopModel {
  String shopName;
  String newsLine;
  String menuType;
  bool menuLogo;
  String shippingPrice;
  String minimumuShipping;
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
      minimumuShipping: map['minimumuShipping'],
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
      minimumuShipping: snap['minimumuShipping'],
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
    this.minimumuShipping,
    this.items,
    this.menu,
    this.homeDesign,
  });
}
