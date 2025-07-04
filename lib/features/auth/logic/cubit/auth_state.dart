// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authcubit.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class GoogleSignInSuccess extends AuthState {}

class GoogleSignInFailed extends AuthState {
  final String error;
  GoogleSignInFailed(this.error);
}

class GoogleSignInLoading extends AuthState {}

class ForgetPasswordLoading extends AuthState {}

class ForgetPasswordSuccess extends AuthState {}

class ForgetPasswordFailed extends AuthState {
  final String error;
  ForgetPasswordFailed(this.error);
}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {

}

class LoginFailed extends AuthState {
  final String error;
  LoginFailed(this.error);
}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailed extends AuthState {
  final String error;
  RegisterFailed(this.error);
}

class EmailVerficationLoading extends AuthState {}

class EmailVerficationSuccess extends AuthState {}

class EmailVerficationFailed extends AuthState {
  final String error;
  EmailVerficationFailed(this.error);
}
class SignOutLoading extends AuthState {}

class SignOutSuccess extends AuthState {}

class SignOutFailed extends AuthState {
  final String error;
  SignOutFailed(this.error);
}

