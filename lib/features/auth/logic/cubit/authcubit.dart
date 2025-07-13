import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../../core/widgets/popups/snakbars.dart';
import '../../../../core/widgets/screens/loading_screen.dart';
import '../../data/model/user_model.dart';
import '../../data/repo/auth_repo.dart';
import '../../data/repo/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final forgetPasswordemailController = TextEditingController();
  final forgetPasswordFormKey = GlobalKey<FormState>();
  final authRepo = AuthRepo();
  final authUser = FirebaseAuth.instance.currentUser;
  final UserRepository userRepo = UserRepository();

  sendPasswordResetEmail(BuildContext context) async {
    try {
      emit(ForgetPasswordLoading());
      FullscreenLoader.openLoadingDialog('Check Your Email', context);
      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullscreenLoader.stopLoading(context);
        return;
      }
      await authRepo.sendPasswordResetEmail(
        email: forgetPasswordemailController.text.trim(),
      );

      emit(ForgetPasswordSuccess());
    } catch (e) {
      emit(ForgetPasswordFailed(e.toString()));
    }
  }

  // Login
  final loginFormKey = GlobalKey<FormState>();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final loginPasswordVisible = true;
  Future<void> loginWithEmailAndPassword(BuildContext context) async {
    try {
      if (!loginFormKey.currentState!.validate()) return;
      emit(LoginLoading());
      FullscreenLoader.openLoadingDialog("Logging In", context);
      final userCredential = await authRepo.loginWithEmailAndPassword(
        email: loginEmailController.text.trim(),
        password: loginPasswordController.text.trim(),
      );
      debugPrint("User Credential$userCredential");
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailed(e.toString()));
    }
  }

  // Register
  final registerFormKey = GlobalKey<FormState>();
  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();
  final registerPasswordVisible = true;
  final registerConfirmPasswordVisible = true;
  Future<void> registerWithEmailAndPassword(context) async {
    try {
      if (!registerFormKey.currentState!.validate()) return;
      emit(RegisterLoading());
      FullscreenLoader.openLoadingDialog("Creating Account", context);
      final userCredential = await authRepo.registerWithEmailAndPassword(
        email: registerEmailController.text.trim(),
        password: registerPasswordController.text.trim(),
      );
      debugPrint("User Credential$userCredential");
      final newUser = UserModel(
        userName: registerNameController.text.trim(),
        email: registerEmailController.text.trim(),
        profilePicture: "",
        id: userCredential.user!.uid,
      );
      await userRepo.saveUserData(user: newUser);
      emit(RegisterSuccess());
      await Future.delayed(const Duration(seconds: 4));
    } catch (e) {
      emit(RegisterFailed(e.toString()));
    }
  }

  Future<void> setTimerForAutoRedirect() async {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.emailVerified ?? false) {
        timer.cancel();
        emit(EmailVerficationSuccess());
      }
    });
  }

  Future<void> sendEmailVerfication() async {
    try {
      emit(EmailVerficationLoading());
      await authRepo.sendEmailVerification();
      setTimerForAutoRedirect();
    } catch (e) {
      emit(EmailVerficationFailed(e.toString()));
    }
  }

  Future<void> googleSignIn(BuildContext context) async {
    try {
      final userCredential = await authRepo.googleSignIn();
      final userData = userCredential.user!;
      final user = UserModel(
        email: userData.email!,
        userName: userData.displayName!,
        profilePicture: "",
        id: userData.uid,
      );
      userRepo.saveUserData(user: user);
      if (context.mounted) {
        CustomSnakbars.successSnackBar(
          context,
          title: "Login Successful",
          message: "Welcome ${userCredential.user?.displayName ?? 'User'}",
        );
      }
      // Show Success SnackBar

      emit(GoogleSignInSuccess());
    } catch (e) {
      debugPrint("Google Sign In Error: $e");
      if (context.mounted) {
        CustomSnakbars.errorSnackBar(
          context,
          title: "Login Failed",
          message: e.toString(),
        );
      }

      emit(GoogleSignInFailed(e.toString()));
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      emit(SignOutLoading());
      await authRepo.signOut();
      if (context.mounted) {
        CustomSnakbars.successSnackBar(
          context,
          title: "Sign Out Successful",
          message: "You have been signed out.",
        );
      }
      emit(SignOutSuccess());
    } catch (e) {
      debugPrint("Sign Out Error: $e");
      if (context.mounted) {
        CustomSnakbars.errorSnackBar(
          context,
          title: "Sign Out Failed",
          message: e.toString(),
        );
      }
      emit(SignOutFailed(e.toString()));
    }
  }
}
