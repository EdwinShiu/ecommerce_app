import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/category.dart';

class CategoryDatabase {

  final DocumentReference categoryCollection = Firestore.instance.collection("Categories").document("Category");

  BigCategoryList _categorySnapshot(DocumentSnapshot snapshot) {
    return BigCategoryList.fromJsonList(snapshot.data["category"]);
  }  

  Stream<BigCategoryList> get categorySnapshot {
    return categoryCollection.snapshots().map(_categorySnapshot);
  }
}