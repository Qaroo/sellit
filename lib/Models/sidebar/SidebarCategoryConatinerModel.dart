import 'package:cloud_firestore/cloud_firestore.dart';

class SidebarCategoryContainerModel {
  String bgColor;
  String textColor;
  double height;
  double padding;
  String textPadding;
  String imagePadding;
  double radius;
  String ontap;
  String text;
  String icon;
  double fontSize;
  String font;

  factory SidebarCategoryContainerModel.fromMap(Map<String, dynamic> map) {
    return SidebarCategoryContainerModel(
        icon: map["icon"],
        text: map["text"],
        padding: map["padding"],
        height: map["height"],
        imagePadding: map["imagePadding"],
        textPadding: map["textPadding"],
        bgColor: map["bgColor"],
        textColor: map["textColor"],
        fontSize: map["fontSize"],
        radius: map["radius"],
        ontap: map["ontap"]);
  }

  factory SidebarCategoryContainerModel.fromDocument(DocumentSnapshot snap) {
    return SidebarCategoryContainerModel(
        icon: snap["icon"],
        text: snap["text"],
        padding: snap["padding"],
        height: snap["height"],
        imagePadding: snap["imagePadding"],
        textPadding: snap["textPadding"],
        fontSize: snap["fontSize"],
        bgColor: snap["bgColor"],
        textColor: snap["textColor"],
        radius: snap["radius"],
        ontap: snap["ontap"]);
  }

  SidebarCategoryContainerModel(
      {this.bgColor,
      this.height,
      this.text,
      this.textColor,
      this.padding,
      this.imagePadding,
      this.textPadding,
      this.radius,
      this.fontSize,
      this.ontap,
      this.icon});
}
