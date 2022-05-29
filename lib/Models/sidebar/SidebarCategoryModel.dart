import 'package:cloud_firestore/cloud_firestore.dart';

class SidebarCategoryModel {
  String title;
  String ontap;
  List<SidebarCategoryModel> childs;

  factory SidebarCategoryModel.fromMap(Map<String, dynamic> map) {
    return SidebarCategoryModel(
        title: map['title'], ontap: map["ontap"], childs: map['childs']);
  }

  factory SidebarCategoryModel.fromDocument(DocumentSnapshot snap) {
    return SidebarCategoryModel(
        title: snap['title'], ontap: snap["ontap"], childs: snap['childs']);
  }

  SidebarCategoryModel({this.title, this.ontap, this.childs});

  @override
  String toString() {
    String txt = title + ":";

    return txt;
  }
}
