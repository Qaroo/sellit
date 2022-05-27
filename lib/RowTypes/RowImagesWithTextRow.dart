import 'package:flutter/cupertino.dart';

class rowImagesWithTextRow {
  double height;
  double radius;
  List<dynamic> images;

  rowImagesWithTextRow({this.height, this.images, this.radius});

  factory rowImagesWithTextRow.fromMap(Map<String, dynamic> map) {
    return rowImagesWithTextRow(
      height: map['height'],
      images: map['images'],
      radius: map['radius'],
    );
  }

  Widget toWidget(BuildContext context) {
    List<Widget> widgets = [];
    print("imagessssss: " + images.length.toString());
    List<dynamic> urls = images;
    for (int i = 0; i < urls.length; i++) {
      widgets.add(Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Image.network(
            urls[i].toString(),
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
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets,
      ),
    );
  }
}
