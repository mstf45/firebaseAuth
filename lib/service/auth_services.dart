import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginauth/home.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ///Kullanıcı Kayıt

  Future<void> signUp(String userName, String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore.collection('user').doc(userCredential.user!.uid).set({
        'email': email,
        'password': password,
        'userName': userName,
      });
      await Fluttertoast.showToast(
        msg: 'Kayıt Başarılı',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Kayıt Başarısız $e',
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
      );
    }
  }

  ///Kullanıcı Giriş

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (context) => const HomePage(),
          ),
          (route) => false,
        );
      }
      await Fluttertoast.showToast(
        msg: 'Giriş Başarılı',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } catch (e) {}
  }

  ///Kullanıcı Çıkış İşlemleri

  Future<void> signOut() async {
    await _auth.signOut();
    await Fluttertoast.showToast(
      msg: 'Çıkış Başarılı',
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }
}
