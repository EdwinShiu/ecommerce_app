import 'package:firebase_auth/firebase_auth.dart';

class User {

  final String uid;

  User({this.uid});
}

class UserInformation {

  final String firstName;
  final String lastName;
  final String emailAddress;

  UserInformation({this.firstName, this.lastName, this.emailAddress});

  // return as json
  Map<String, String> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "emailAddress": emailAddress,
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