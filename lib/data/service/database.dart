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

  void updateFavorite(List<String> favStringList) {
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap = await transaction.get(userCollection.document(uid));
      await transaction.update(freshSnap.reference, {
        "userInformation": freshSnap["userInformation"],
        "warranty": freshSnap["warranty"],
        "favorite": favStringList,
      });
    });
  }

  // Full User Data Set
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    //print("hi");
    //print(snapshot.data);
    if (snapshot.data == null) {
      return null;
    }
    //print(snapshot.data["favorite"].toString());
    //print(_userInformationFromSnapshot(snapshot));
    //print(_userWarrantyFromSnapshot(snapshot));
    //if (snapshot.data["favorite"].length == 0) {
    //  List<String> temp = [];
    //  return UserData(
    //    favorite: temp,
    //    userInformation: _userInformationFromSnapshot(snapshot),
    //    warranty: _userWarrantyFromSnapshot(snapshot)
    //  );
    // }
    //else {
      //print(snapshot.data["favorite"].cast<String>().toList().runtimeType.toString());
    return UserData(
      favorite: snapshot.data["favorite"].cast<String>().toList(),
      userInformation: _userInformationFromSnapshot(snapshot),
      warranty: _userWarrantyFromSnapshot(snapshot)
    );
    //}
  }

  // User Warranty
  List<Warranty> _userWarrantyFromSnapshot(DocumentSnapshot snapshot) {
    //print(snapshot.data["warranty"]);
    if (snapshot.data["warranty"].length == 0) {
      List<Warranty> temp = [];
      return temp;
    }
    //print(List<Warranty>.from(snapshot.data["warranty"].map((data) => Warranty.fromJson(data))).runtimeType);
    return List<Warranty>.from(snapshot.data["warranty"].map((data) => Warranty.fromJson(data)));
  }


  // User Information
  UserInformation _userInformationFromSnapshot(DocumentSnapshot snapshot) {
    //print(snapshot.data["userInformation"]);
    return UserInformation(
      firstName: snapshot.data["userInformation"]["firstName"].toString(),
      lastName: snapshot.data["userInformation"]["lastName"].toString(),
      emailAddress: snapshot.data["userInformation"]["emailAddress"].toString(),
      sonnion: snapshot.data["userInformation"]["sonnion"].toString(),
    );
  }

  // Get user stream
  Stream<UserData> get userSnapshot {
    //print(uid);
    //print("user Collection" + userCollection.document(uid).toString());
    if (uid == null) {
      return null;
    }
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

}