import 'package:ecommerce_app/data/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../data/user.dart';

class AuthService {

  final FirebaseAuth auth = FirebaseAuth.instance;
 
  // create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {     // base on the user
    return user != null ? User(uid: user.uid) : null;     // create custom User class with uid
  }

  Stream<User> get user {
    return auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }
 
  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await auth.signInAnonymously();    // signing in to firebase and return 
      FirebaseUser user = result.user;              // return the user data
      return _userFromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());                // error
      return null;
    }
  }

  // sign in with email & password
  Future signInAccount(String username, String password) async {
    try {
      AuthResult result = await auth.signInWithEmailAndPassword(email: username, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }


  // register with email & password
  Future registerAccount(String username, String password) async {
    try {
      AuthResult result = await auth.createUserWithEmailAndPassword(email: username, password: password);
      FirebaseUser user = result.user;
      // create a new document for the user with the uid
      await DataBaseService(uid: user?.uid).updateUserData(
        UserInformation(                                    // dummy value
          firstName: "Edwin",
          lastName: "Shiu",
          emailAddress: username,
          sonnion: "0",
        ),
        [],
        [
          Warranty(
            itemName: "ZX300",
            serialNumber: "aabbccddeeff",
            purchaseDate: "20200815",
            duration: "366"
          ),
        ],
      );
      return _userFromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }


  // sign out
  Future signOut() async {
    try {
      return await auth.signOut();
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }


}