import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pentagonselllit/args.dart' as args;
import 'dart:collection';

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
  Map<String, dynamic> options;
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
    if (this.stock == null) return [];
    List<List<String>> res = [];
    List<String> res2 = [];
    for (String stock_option in this.stock.keys) {
      List<String> partly = stock_option.split('/');
      if (partly == null) continue;
      List<String> z = new List<String>.from(partly);
      for (String part in partly) {
        if (selected.contains(part) && z.contains(part)) z.remove(part);
      }
      if (z.length == this.options.length - selected.length &&
          this.stock[stock_option] > 0) res.add(z);
    }
    for (List<String> x1 in res) {
      for (String x2 in x1) {
        if (!res2.contains(x2)) res2.add(x2);
      }
    }
    return res2;
  }

  int rateSimilar(ItemModel item) {
    int rate = 0;
    for (String tag in item.tags) {
      if (this.tags.contains(tag)) rate++;
    }
    return rate;
  }

  List<ItemModel> similarProducts(int max) {
    Map<ItemModel, int> rating = {};
    for (ItemModel item in args.shopModel.items) {
      if (item == this) continue;
      rating[item] = rateSimilar(item);
    }
    final sorted = SplayTreeMap<ItemModel, int>.from(
        rating, (keys1, keys2) => rating[keys2].compareTo(rating[keys1]));

    if (max >= sorted.length) {
      return sorted.keys.toList();
    } else {
      return sorted.keys.take(max).toList();
    }
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
