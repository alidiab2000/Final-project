import 'package:bloc/bloc.dart';
import 'package:final_project/core/widgets/screens/loading_screen.dart';
import 'package:final_project/features/auth/data/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final forgetPasswordemailController = TextEditingController();
  final forgetPasswordFormKey = GlobalKey<FormState>();
  final authRepo = AuthRepo();
  final authUser = FirebaseAuth.instance.currentUser;
  sendPasswordResetEmail(BuildContext context) async {
    try {
      emit(ForgetPasswordLoading());
      FullscreenLoader.openLoadingDialog('Check Your Email', context);
      if (!forgetPasswordFormKey.currentState!.validate()) {
        await Future.delayed(const Duration(seconds: 4));
        debugPrint('Form is not valid');
        return;
      }
      await authRepo.sendPasswordResetEmail(
        email: forgetPasswordemailController.text.trim(),
      );
      await Future.delayed(const Duration(seconds: 4));
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
  Future<void> loginWithEmailAndPassword(context) async {
    try {
      if (!loginFormKey.currentState!.validate()) return;
      emit(LoginLoading());
      FullscreenLoader.openLoadingDialog("Logging In", context);
      final userCredential = await authRepo.loginWithEmailAndPassword(
        email: loginEmailController.text.trim(),
        password: loginPasswordController.text.trim(),
      );
      debugPrint("User Credential$userCredential");
      await Future.delayed(const Duration(seconds: 4));
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
      emit(RegisterSuccess());
      await Future.delayed(const Duration(seconds: 4));
    } catch (e) {
      emit(RegisterFailed(e.toString()));
    }
  }


  Future<void>sendEmailVerfication()async{
    try {
      emit(EmailVerficationLoading());
    await authRepo.sendEmailVerification();
    emit(EmailVerficationSuccess());
    } catch (e) {
      emit(EmailVerficationFailed(e.toString()));
    }
    
  }
  Future<void> checkEmailVerified()async{
    final currentUser=FirebaseAuth.instance.currentUser;
  if(currentUser!=null&& currentUser.emailVerified){
    
    emit(EmailVerficationSuccess());
  }else{
    emit(EmailVerficationFailed("Email is not verified"));
  }
}
}