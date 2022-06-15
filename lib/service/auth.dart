import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signIn(String email, String password) async {
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      debugPrint("signin calisti");
    } catch (e) {
      print(e);
    }
  }

  signOut() async {
    return await _auth.signOut();
  }

  Future<User?> createPerson(String ad, String soyad, String eposta,
      String parola, int yas, int kilo, int boy) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: eposta, password: parola);
    await _firestore.collection("Kullanicilar").doc(user.user!.email).set({
      "ad": ad,
      "soyad": soyad,
      "email": eposta,
      "parola": parola,
      "yas": yas,
      "kilo": kilo,
      "boy": boy
    });
    return user.user;
  }
}
