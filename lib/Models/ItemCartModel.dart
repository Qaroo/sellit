import 'package:cloud_firestore/cloud_firestore.dart';

class ItemCartModel {
  String name;
  String price;
  String image;
  String id;
  Map<String, dynamic> selected_options;

  factory ItemCartModel.fromMap(Map<String, dynamic> map) {
    return ItemCartModel(
        name: map['name'],
        price: map['price'],
        image: map['image'],
        selected_options: map['selected_options'],
        id: map['id']);
  }

  String get_dotted() {
    String selected_options_string = "";
    if (selected_options.isEmpty) {
      return selected_options_string;
    }
    for (String option in this.selected_options.values) {
      selected_options_string += option + " • ";
    }
    selected_options_string = selected_options_string.substring(
        0, selected_options_string.length - 3);
    return selected_options_string;
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "price": price,
      "image": image,
      "id": id,
      "selected_options": selected_options
    };
  }

  factory ItemCartModel.fromDocument(DocumentSnapshot snap) {
    return ItemCartModel(
        name: snap['name'],
        price: snap['price'],
        image: snap['image1'],
        selected_options: snap['selected_options'],
        id: snap['id']);
  }
  String str() {
    return "name:" + name + "price: " + price + "image: " + image;
  }

  ItemCartModel({
    this.name,
    this.price,
    this.image,
    this.id,
    this.selected_options,
  });
}
