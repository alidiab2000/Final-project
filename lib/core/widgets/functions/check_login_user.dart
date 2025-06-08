import 'package:final_project/core/router/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> checkIfLoggedInAndVerfiedUser() async {
  final firebaseAuth = FirebaseAuth.instance;
  final prefs = await SharedPreferences.getInstance();

  FlutterNativeSplash.remove();

  const String isFirstTimeKey = "isFirstTime";
  final user = firebaseAuth.currentUser;

  if (user != null) {
    debugPrint("User is logged in: ${user.email}");

    if (user.emailVerified) {
      debugPrint("Email is verified.");
      final isLocationGiven = await checkIfLocationGiven();
      return isLocationGiven;
    } else {
      debugPrint("Email is not verified.");
      return Routes.verifyEmail;
    }
  }

  // Handle first-time user logic
  final isFirstTime = prefs.getBool(isFirstTimeKey) ?? true;

  if (isFirstTime) {
    await prefs.setBool(isFirstTimeKey, false);
    return Routes.onboarding;
  }

  return Routes.login;
}

Future<String> checkIfLocationGiven() async {
  final prefs = await SharedPreferences.getInstance();
  const String isLocationGivenKey = "isLocationGiven";
  final isLocationGiven = prefs.getBool(isLocationGivenKey) ?? true;

  if (isLocationGiven) {
    return Routes.navigationBarMenu;
  } else {
    debugPrint("Location is not given.");
    prefs.setBool(isLocationGivenKey, true);
    return Routes.location;
  }
}
