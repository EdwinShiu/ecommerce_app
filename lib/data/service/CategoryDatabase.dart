import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/category.dart';

class CategoryDatabase {

  final DocumentReference categoryCollection = Firestore.instance.collection("Categories").document("Category");

  BigCategoryList _categorySnapshot(DocumentSnapshot snapshot) {
    if (snapshot.data["category"] == null) {
      print("error");
      return null;
    }
    return BigCategoryList.fromJsonList(snapshot.data["category"]);
  }  

  Stream<BigCategoryList> get categorySnapshot {
    print("firebase used");
    return categoryCollection.snapshots().map(_categorySnapshot);
  }
}