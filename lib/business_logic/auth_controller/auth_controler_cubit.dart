import 'package:bloc/bloc.dart';
import 'package:e_commerce/controller/database_controller.dart';
import 'package:e_commerce/data/models/user_model.dart';
import 'package:e_commerce/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

part 'auth_controler_state.dart';

class AuthControlerCubit extends Cubit<AuthControlerState> {
  AuthControlerCubit({required this.authBase, required this.databaseController}) : super(AuthControlerInitial());
  final Auth authBase;
    final DatabaseController databaseController;


  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await authBase.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginWithEmailAndPasswrd());
    } on FirebaseAuthException catch (e) {
      emit(
        LoginWithEmailAndPasswordFailure(
          e.message ?? 'An error occurred during login',
        ),
      );
    } catch (e) {
      emit(LoginWithEmailAndPasswordFailure(e.toString()));
    }
  }

  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final firebaseUser = await authBase.registerWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userId = firebaseUser!.uid;
      final userData = UserData(
        uid: userId,
        email: firebaseUser.email!,
        name: name,
      );
      await databaseController.setUserData(userData: userData,userId: userId);
      emit(RegisterWithEmailAndPassword());
    } on FirebaseAuthException catch (e) {
      emit(
        LoginWithEmailAndPasswordFailure(
          e.message ?? 'An error occurred during login',
        ),
      );
    } catch (e) {
      emit(LoginWithEmailAndPasswordFailure(e.toString()));
    }
  }

  Future<void> logOutWithEmailAndPassword() async {
    await authBase.logOut();
    emit(LogOutWithEmailAndPassword());
  }
}
