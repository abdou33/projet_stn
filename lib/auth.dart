import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
class Auth{
  final FirebaseAuth_firebaseAuth.currentUser;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?>get authStateChange => _firebaseAuth.authStateChanges();
  Future<void>signInWithEmailAndPassword({
    required String email,
    required String password,
  })async{
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    )
  }
   Future<void>signInWithEmailAndPassword({
    required String email,
    required String password,
  })async{
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    )
  }
  Future<void> singOut()async{
    await _firebaseAuth.singOut();
  }
}