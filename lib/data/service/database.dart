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

  // user information
  UserInformation _userInformationFromSnapshot(DocumentSnapshot snapshot) {
    return UserInformation(
      firstName: snapshot.data["userInformation"]["firstName"].toString(),
      lastName: snapshot.data["userInformation"]["lastName"].toString(),
      emailAddress: snapshot.data["userInformation"]["emailAddress"].toString(),
      sonnion: snapshot.data["userInformation"]["sonnion"].toString(),
    );
  }

  // get user stream
  Stream<UserInformation> get userSnapshot {
    //print(uid);
    return userCollection.document(uid).snapshots().map(_userInformationFromSnapshot);
  }

}