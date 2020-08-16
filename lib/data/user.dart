

class User {

  final String uid;

  User({this.uid});
}

class UserData {

  final UserInformation userInformation;
  final List<String> favorite;
  final List<Warranty> warranty;

  UserData({this.userInformation, this.favorite, this.warranty});

  Map<String, dynamic> toJson() {
    return {
      "favorite": favorite,
      "userInformation": userInformation.toJson(),
      "warranty": warranty,
    };
  }
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

  factory Warranty.fromJson(Map<String, String> json) {
    return Warranty(
      itemName: json["itemName"],
      serialNumber: json["itemName"],
      purchaseDate: json["purchaseDate"],
      duration: json["duration"],
    );
  }
  
}