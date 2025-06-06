import 'dart:async';

import 'package:final_project/core/errors/firebase_auth_exceptions.dart';
import 'package:final_project/core/errors/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
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

  Future<void> sendPasswordResetEmail({required String email}) async {
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

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      _auth.currentUser?.reload();
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

  Future<void> logout() async {
    try {
      await _auth.signOut();
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

  Future<UserCredential> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      debugPrint("Error firebase:=================================> $e");
      throw FirebaseAuthExceptions(e.code).message;
    } on PlatformException catch (e) {
      debugPrint("Error platform:=================================> $e");
      throw PlatformException(e.code).message;
    } catch (e) {
      debugPrint("Error:=================================> $e");
      throw "Something went wrong, please try again later";
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      debugPrint("Error firebase:=================================> $e");
      throw FirebaseAuthExceptions(e.code).message;
    } on PlatformException catch (e) {
      debugPrint("Error platform:=================================> $e");
      throw PlatformException(e.code).message;
    } catch (e) {
      debugPrint("Error:=================================> $e");
      throw "Something went wrong, please try again later";
    }
  }
}
