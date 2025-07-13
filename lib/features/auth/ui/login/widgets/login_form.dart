import '../../../../../core/helper/app_regex.dart';
import '../../../../../core/helper/extensions.dart';
import '../../../../../core/router/router.dart';
import '../../../../../core/themes/styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/constants.dart';
import '../../../../../core/widgets/commen/custom_button.dart';
import '../../../../../core/widgets/commen/custom_text_field.dart';
import '../../../logic/cubit/authcubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<AuthCubit>();
    loginBloc.loginEmailController.text = "alidiab8899@gmail.com";
    loginBloc.loginPasswordController.text = "Alidiab2003#";
    return Form(
      key: loginBloc.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            hint: "Enter your email",
            label: "Email",
            validator: (email) {
              if (email == null || email.isEmpty) {
                return 'Please enter your email';
              } else if (!AppRegex.isEmailValid(email)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            controller: loginBloc.loginEmailController,
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            hint: "Enter your password",
            label: "Password",
            suffix: true,
            obscureText: loginBloc.loginPasswordVisible,
            controller: loginBloc.loginPasswordController,
            validator: (password) {
              if (password == null || password.isEmpty) {
                return 'Please enter your password';
              } else if (!AppRegex.isPasswordValid(password)) {
                return Constants.passwordNotValid;
              }

              return null;
            },
          ),
          SizedBox(height: 10.h),
          TextButton(
            onPressed: () => context.pushNamed(Routes.forgetPassword),
            child: Text(
              "Forgot Password?",
              style: TextStyles.font14GrayRegular.copyWith(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Row(
            children: [
              Checkbox(value: true, onChanged: (value) {}),
              Text(
                "Rember me",
                style: TextStyles.font14GrayRegular.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          CustomButton(
            buttonText: "Login",
            onPressed:
                () async => await loginBloc.loginWithEmailAndPassword(context),
          ),
        ],
      ),
    );
  }
}
