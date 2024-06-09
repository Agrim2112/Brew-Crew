import 'dart:async';
import 'package:brew_crew/models/UserModel.dart';
import 'package:brew_crew/models/UserModel.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? _userFirebase(User? user){
    return user!=null? UserModel(uid: user.uid):null;
  }

  Stream<UserModel?> get user{
    return _auth.authStateChanges()
    .map( _userFirebase);
  }

  Future signInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user= result.user!!;
      return _userFirebase(user);
  }
  catch(e){
      print(e.toString());
      return null;
  }
}
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await DatabaseService(uid: user!.uid).updateData('0', 'New Crew Member', 100);
      return _userFirebase(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFirebase(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

}