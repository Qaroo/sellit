import 'package:flutter/cupertino.dart';

class rowImagesRow {
  double height;
  double radius;
  List<String> images;

  rowImagesRow({this.height, this.images, this.radius});

  factory rowImagesRow.fromMap(Map<String, dynamic> map) {
    return rowImagesRow(
      height: map['height'],
      images: map['images'],
      radius: map['radius'],
    );
  }

  Widget toWidget(BuildContext context) {
    List<Widget> widgets = [];
    List<String> urls = images;
    for (int i = 0; i < urls.length; i++) {
      widgets.add(Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Image.network(
            urls[i],
            fit: BoxFit.cover,
            height: height,
          ),
        ),
      ));
      widgets.add(SizedBox(
        width: 10,
      ));
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets,
      ),
    );
  }
}
