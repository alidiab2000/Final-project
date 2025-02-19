import 'package:bloc/bloc.dart';
import 'package:final_project/core/widgets/screens/loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final forgetPasswordemailController = TextEditingController();
  final forgetPasswordFormKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final authUser = FirebaseAuth.instance.currentUser;
  sendPasswordResetEmail(BuildContext context) async {
    try {
      emit(ForgetPasswordLoading());
      FullscreenLoader.openLoadingDialog('Check Your Email', context);
      if (!forgetPasswordFormKey.currentState!.validate()) {
        await Future.delayed(const Duration(seconds: 5));
        debugPrint('Form is not valid');
        return;
      }
      await _auth.sendPasswordResetEmail(
        email: forgetPasswordemailController.text.trim(),
      );
      await Future.delayed(const Duration(seconds: 5));
      emit(ForgetPasswordSuccess());
    } catch (e) {
      emit(ForgetPasswordFailed(e.toString()));
    }
  }

  // Login

  // Register
  final registerFormKey = GlobalKey<FormState>();
  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();

  registerWithEmailAndPassword( context) async {
    try {
      emit(RegisterLoading());
      FullscreenLoader.openLoadingDialog("Creating Account", context);
      await _auth.createUserWithEmailAndPassword(
        email: registerEmailController.text.trim(),
        password: registerPasswordController.text.trim(),
      );
      await Future.delayed(const Duration(seconds: 4));
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailed(e.toString()));
    }
  }
}
