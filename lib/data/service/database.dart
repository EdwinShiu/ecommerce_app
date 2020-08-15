import 'package:cloud_firestore/cloud_firestore.dart';
import '../user.dart';

class DataBaseService {

  final String uid;

  DataBaseService({this.uid});

  // Collection Reference or create a colletion and reference it
  final CollectionReference userCollection = Firestore.instance.collection("User");     
  // create/modify the data in uid
  Future updateUserData(UserInformation userInformation, List<String> favorite, List<Warranty> warranty) async {
    return await userCollection.document(uid).setData({                     
      "userInformation": userInformation.toJson(),
      "favorite": favorite,
      "warranty": warranty.map((warranty) => warranty.toJson()).toList(),   // map everything in warranty to json and to list
    });
  }

}