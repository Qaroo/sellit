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
  Map<String, dynamic> sizes;
  List<Map<String, dynamic>> options;
  List<Map<String, Map<String, dynamic>>> stock;

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
        id: snap['idi']);
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
      this.stock});
}
