import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/product.dart';

class ProductDatabase {

  final DocumentReference itemDocument = Firestore.instance.collection("Categories").document("Items");

  Products _categorySnapshot(DocumentSnapshot snapshot) {
    if (snapshot.data["ItemList"] == null) {
      print("error");
      return null;
    }
    return Products.fromJsonList(snapshot.data["ItemList"]);
  }  

  Stream<Products> get productSnapshot {
    print("firebase used for product");
    return itemDocument.snapshots().map(_categorySnapshot);
  }

}
