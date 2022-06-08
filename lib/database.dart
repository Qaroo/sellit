import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pentagonselllit/Models/ShopModel.dart';

bool check_domain(domain) {
  FirebaseFirestore.instance
      .collection("domains")
      .doc(domain)
      .get()
      .then((event) {
    return event.data() != null;
  });
}

bool get_shopID(domain) {
  FirebaseFirestore.instance
      .collection("domains")
      .doc(domain)
      .get()
      .then((event) {
    return event.data()["shopID"];
  });
}

Map<String, dynamic> load_shop(shopID) {
  print("shopzz loading");
  FirebaseFirestore.instance
      .collection("sites")
      .doc("shopID")
      .get()
      .then((value) {
    print("shopzz loaded;");
    ShopModel.fromMap(value.data());
  });
}
