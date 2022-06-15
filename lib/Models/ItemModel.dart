import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  String name;
  String brand;
  String price;
  String image1;
  String category;
  String gender;
  String description;
  String id;
  List<dynamic> tags;
  Map<String, dynamic> sizes;
  List<dynamic> options;
  Map<String, dynamic> stock;
  //

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
        name: map['name'],
        brand: map["brand"],
        price: map['price'],
        image1: map['image1'],
        category: map['category'],
        gender: map['gender'],
        description: map['description'],
        sizes: map['sizes'],
        options: map['options'],
        stock: map['stock'],
        tags: map['tags'],
        id: map['id']);
  }

  factory ItemModel.fromDocument(DocumentSnapshot snap) {
    return ItemModel(
        name: snap['name'],
        brand: snap["brand"],
        price: snap['price'],
        image1: snap['image1'],
        category: snap['category'],
        gender: snap['gender'],
        description: snap['description'],
        sizes: snap['sizes'],
        options: snap['options'],
        stock: snap['stock'],
        tags: snap['tags'],
        id: snap['id']);
  }

  //Returns list of other categories that can selected. for example,
  //calculate_stock(["red"]) -> ["XS","S","M"]
  //calculate_stock(["XS"]) -> ["blue","green"]
  List<String> calculate_stock(List<dynamic> selected) {
    List<List<String>> res = [];
    List<String> res2 = [];
    for (String stock_option in this.stock.keys) {
      List<String> partly = stock_option.split('/');
      if (partly == null) continue;
      for (String part in partly) {
        if (selected.contains(part)) partly.remove(part);
      }
      if (partly.length == this.options.length - selected.length &&
          this.stock[stock_option] > 0) res.add(partly);
    }
    for (List<String> x1 in res) {
      for (String x2 in x1) {
        if (!res2.contains(x2)) res2.add(x2);
      }
    }
    return res2;
  }

  ItemModel(
      {this.name,
      this.brand,
      this.price,
      this.image1,
      this.category,
      this.gender,
      this.description,
      this.id,
      this.sizes,
      this.options,
      this.stock,
      this.tags});
}
