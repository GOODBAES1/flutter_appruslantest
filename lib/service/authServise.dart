import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_appruslantest/model/user.dart';
import 'package:flutter_appruslantest/service/database.dart';
class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user){
    return user!= null? User(uid: user.uid):null;
  }
  Stream<User> get user{
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user)=>_userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }

  Future singInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Future signWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    await DatabaseService(uid: user.uid).updateUserData('0', 'new baes solid', 100);
    return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Future signOut() async{
try{
  return await _auth.signOut();
} catch(e){
  print(e.toString());
  return null;
}
}

  //singin email

}