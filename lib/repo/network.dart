import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Network {
  final _auth = FirebaseAuth.instance;
  registerUser(String email, String password) {
    _auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
