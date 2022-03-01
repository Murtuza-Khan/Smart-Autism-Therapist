import 'package:admin/Chat_App/models/user.dart';
import 'package:admin/Chat_App/views/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Userss? _userFromFirebaseUser(User? user) {
    return user != null ? Userss(uid: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn? _googleSignIn = new GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn!.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication!.idToken,
        accessToken: googleSignInAuthentication.accessToken!);

    UserCredential result = await _auth.signInWithCredential(credential);
    print(result);

    // ignore: unnecessary_null_comparison

    return await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Chat()));
    
  }

  Future signOut() async {
    // try {
    //   return await _auth.signOut();
    // } catch (e) {
    //   print(e.toString());
    //   return null;
    // }
  }
}
