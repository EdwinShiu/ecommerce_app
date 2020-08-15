import 'package:firebase_auth/firebase_auth.dart';

class User {

  final String uid;

  User({this.uid});
}

class UserInformation {

  final String firstName, lastName, emailAddress, sonnion;

  UserInformation({this.firstName, this.lastName, this.emailAddress, this.sonnion});

  // return as json
  Map<String, String> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "emailAddress": emailAddress,
      "sonnion": sonnion
    };
  }
}

class Warranty {

  final String itemName;
  final String serialNumber;
  final String purchaseDate;
  final String duration;

  Warranty({this.itemName, this.serialNumber, this.purchaseDate, this.duration});

  // return as json
  Map<String, String> toJson() {
    return {
      "itemName": itemName,
      "serialNumber": serialNumber,
      "purchaseDate": purchaseDate,
      "duration": duration,
    };
  }
  
}