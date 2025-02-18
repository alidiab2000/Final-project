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
      FullscreenLoader.openLoadingDialog('Please wait', context);
      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullscreenLoader.stopLoading(context);
        debugPrint('Form is not valid');
        return;
      }
      await _auth.sendPasswordResetEmail(
        email: forgetPasswordemailController.text.trim(),
      );
      emit(ForgetPasswordSuccess());
    } catch (e) {
      emit(ForgetPasswordFailed(e.toString()));
    }
  }

  // Login

  // Register
}
