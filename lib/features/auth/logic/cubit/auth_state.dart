part of 'authcubit.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class ForgetPasswordLoading extends AuthState {}

class ForgetPasswordSuccess extends AuthState {}

class ForgetPasswordFailed extends AuthState {
  final String error;
  ForgetPasswordFailed(this.error);

}
class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

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
