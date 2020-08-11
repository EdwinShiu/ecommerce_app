import 'package:firebase_auth/firebase_auth.dart';
import '../data/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
 
  // create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {     // base on the user
    return user != null ? User(uid: user.uid) : null;     // create custom User class with uid
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }
 
  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();    // signing in to firebase and return 
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
      AuthResult result = await _auth.signInWithEmailAndPassword(email: username, password: password);
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
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: username, password: password);
      FirebaseUser user = result.user;
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
      return await _auth.signOut();
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }


}