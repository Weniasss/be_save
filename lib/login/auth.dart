import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class Auth {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    }) async {
    log('email: $email');
    log('password: $password');
    var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password);
    log('user credantials: $userCredential');
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

}