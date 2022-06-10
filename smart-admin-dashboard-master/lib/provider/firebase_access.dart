import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'package:fluttertoast/fluttertoast.dart';
class FirebaseAccessProvider {
  final googleSignIn = GoogleSignIn();

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      print("here");
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
      //  Fluttertoast.showToast(
      //     msg: 'Something went wrong',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      return false;
    }
  }

  Future emailAndPasswordLogin(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
           Fluttertoast.showToast(
            msg: 'Something went wrong',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      // if (e.code == 'user-not-found') {
      //  Fluttertoast.showToast(
      //     msg: 'No user found for that email.',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);

      return false;
      // } else if (e.code == 'wrong-password') {
      //   Fluttertoast.showToast(
      //       msg: 'Wrong password provided for that user.',
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: Colors.red,
      //       textColor: Colors.white,
      //       fontSize: 16.0);
      // }
    }
  }

  createEmailAndPasswordLogin(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print(e);
      if (e.toString().contains('firebase_auth/email-already-in-use')) {
        Fluttertoast.showToast(
            msg:  'The email address is already in use by another account',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }else{
            Fluttertoast.showToast(
            msg: 'Something went wrong',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }

      return false;
      // if(e.code =='email-already-in-use'){
      //     Fluttertoast.showToast(
      //       msg: 'The email address is already in use by another account',
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: Colors.red,
      //       textColor: Colors.white,
      //       fontSize: 16.0);
      // }else{

      // }

    }
  }

  void googleDisconnect() async {
    if (googleSignIn != null) {
      await googleSignIn.disconnect();
    }
  }

  Future logout() async {
   
    FirebaseAuth.instance.signOut();
  }
}
