import 'package:final_project/core/helper/extensions.dart';
import 'package:final_project/core/router/router.dart';
import 'package:final_project/core/themes/styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/commen/custom_button.dart';
import '../../../../../core/widgets/commen/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            hint: "Enter your name",
            label: "Name",
            controller: TextEditingController(),
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            hint: "Enter your password",
            label: "Password",
            controller: TextEditingController(),
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
          CustomButton(buttonText: "Login", onPressed: () {}),
        ],
      ),
    );
  }
}
