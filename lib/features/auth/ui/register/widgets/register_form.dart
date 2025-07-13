import '../../../../../core/helper/app_regex.dart';
import '../../../../../core/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/styles.dart';
import '../../../../../core/widgets/commen/custom_button.dart';
import '../../../../../core/widgets/commen/custom_text_field.dart';
import '../../../logic/cubit/authcubit.dart';
import '../functions/check_passwrd_match.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().registerFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            hint: "Enter your name",
            label: "Name",
            controller: context.read<AuthCubit>().registerNameController,
            validator:
                (name) =>
                    (name == null || name.isEmpty)
                        ? 'Please enter your name'
                        : null,
          ),

          SizedBox(height: 20.h),
          CustomTextField(
            hint: "Email/Phone Number",
            label: "Email",
            controller: context.read<AuthCubit>().registerEmailController,
            validator:
                (email) =>
                    (email == null || email.isEmpty)
                        ? 'Please enter your email'
                        : (AppRegex.isEmailValid(email)
                            ? null
                            : 'Please enter a valid email'),
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            hint: "Enter your password",
            label: "Password",
            obscureText: context.read<AuthCubit>().registerPasswordVisible,
            suffix: true,
            controller: context.read<AuthCubit>().registerPasswordController,
            validator:
                (password) =>
                    (password == null || password.isEmpty)
                        ? 'Please enter your password'
                        : (AppRegex.isPasswordValid(password)
                            ? null
                            : Constants.passwordNotValid),
          ),

          SizedBox(height: 20.h),
          CustomTextField(
            hint: "Password",
            label: "Confirm Password",
            obscureText:
                context.read<AuthCubit>().registerConfirmPasswordVisible,
            suffix: true,
            controller:
                context.read<AuthCubit>().registerConfirmPasswordController,
            validator: (password) {
              return CheckPasswrdMatch.checkPasswordMatch(
                context.read<AuthCubit>().registerPasswordController.text,
                context
                    .read<AuthCubit>()
                    .registerConfirmPasswordController
                    .text,
              );
            },
          ),

          SizedBox(height: 10.h),
          Row(
            children: [
              Checkbox(value: true, onChanged: (value) {}),
              Text("Rember me", style: TextStyles.font12BlackBold),
            ],
          ),
          SizedBox(height: 20.h),
          CustomButton(
            buttonText: "Create Account",
            onPressed:
                () async => context
                    .read<AuthCubit>()
                    .registerWithEmailAndPassword(context),
          ),
        ],
      ),
    );
  }
}
