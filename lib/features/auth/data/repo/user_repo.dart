import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/core/errors/firebase_auth_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/errors/platform_exceptions.dart';
import '../model/user_model.dart';

class UserRepository {
  // Database

  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  // Function To Add User Data
  Future<void> saveUserData({required UserModel user}) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
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

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentationSnapshot =
          await _db.collection("Users").doc(_auth.currentUser!.uid).get();
      if (documentationSnapshot.exists) {
        return UserModel.fromSnapShot(documentationSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      throw FirebaseAuthExceptions(e.code).message;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      throw PlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }


  Future<void> updateUserDetails({required UserModel updateUser}) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
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

  Future<void> updateSingleField({required Map<String, dynamic> json}) async {
    try {
      await _db.collection("Users").doc(_auth.currentUser!.uid).update(json);
    } on FirebaseException catch (e) {
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

  Future<void> removeUserData({required String userID}) async {
    try {
      await _db.collection("Users").doc(userID).delete();
    } on FirebaseException catch (e) {
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

  Future<String> uploadImage({
    required String path,
    required XFile image,
  }) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      return await ref.getDownloadURL();
    } on FirebaseException catch (e) {
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
