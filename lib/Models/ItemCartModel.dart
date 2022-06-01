import 'package:cloud_firestore/cloud_firestore.dart';

class ItemCartModel {
  String name;
  String price;
  String image1;
  String id;
  Map<String, dynamic> selected_options;

  factory ItemCartModel.fromMap(Map<String, dynamic> map) {
    return ItemCartModel(
        name: map['name'],
        price: map['price'],
        image1: map['image1'],
        selected_options: map['selected_options'],
        id: map['id']);
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "price": price,
      "image": image1,
      "id": id,
      "selected_options": selected_options
    };
  }

  factory ItemCartModel.fromDocument(DocumentSnapshot snap) {
    return ItemCartModel(
        name: snap['name'],
        price: snap['price'],
        image1: snap['image1'],
        selected_options: snap['selected_options'],
        id: snap['id']);
  }

  ItemCartModel({
    this.name,
    this.price,
    this.image1,
    this.id,
    this.selected_options,
  });
}
