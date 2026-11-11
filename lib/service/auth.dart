import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthBase {
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<User?> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<User?> registerWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> logOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('Firebase Auth Error: ${e.message}');
      // rethrow;
      throw e.message ?? 'An error occurred during login';
    }
  }

  @override
  Future<User?> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return user.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('Unexpected Error: $e');
      throw 'An error occurred while creating an account';
    }
  }

  @override
  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}
