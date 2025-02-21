import 'package:final_project/core/errors/firebase_auth_exceptions.dart';
import 'package:final_project/core/errors/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRepo {
  final _auth = FirebaseAuth.instance;
  
  Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      throw FirebaseAuthExceptions(e.code).message;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      throw PlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw "Something went wrong, please try again later";
    }
  }

  Future<void> sendPasswordResetEmail( {required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      throw FirebaseAuthExceptions(e.code).message;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      throw PlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw "Something went wrong, please try again later";
    }
  }

  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      throw FirebaseAuthExceptions(e.code).message;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      throw PlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw "Something went wrong, please try again later";
    }
  }
}
