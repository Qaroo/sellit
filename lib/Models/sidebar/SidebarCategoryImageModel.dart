import 'package:cloud_firestore/cloud_firestore.dart';

class SidebarCategoryImageModel {
  String url;
  double padding;
  double radius;
  String ontap;

  factory SidebarCategoryImageModel.fromMap(Map<String, dynamic> map) {
    return SidebarCategoryImageModel(
        url: map["url"],
        padding: map["padding"],
        radius: map["radius"],
        ontap: map["ontap"]);
  }

  factory SidebarCategoryImageModel.fromDocument(DocumentSnapshot snap) {
    return SidebarCategoryImageModel(
        url: snap["url"],
        padding: snap["padding"],
        radius: snap["radius"],
        ontap: snap["ontap"]);
  }

  SidebarCategoryImageModel({this.url, this.ontap, this.padding, this.radius});
}
