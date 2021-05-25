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
      this.sizes});
}
