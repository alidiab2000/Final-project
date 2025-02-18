import 'package:final_project/core/themes/styles.dart';
import 'package:final_project/core/widgets/custom_button.dart';
import 'package:final_project/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(hint: "Enter your name", label: "Name"),
          SizedBox(height: 20.h),
          CustomTextField(hint: "Enter your password", label: "Password"),
          SizedBox(height: 10.h),
          TextButton(
            onPressed: () {},
            child: Text("Forgot Password", style: TextStyles.font12BlackBold),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Checkbox(value: true, onChanged: (value) {}),
              Text("Rember me", style: TextStyles.font12BlackBold),
            ],
          ),
          SizedBox(height: 40.h),
          CustomButton(buttonText: "Login", onPressed: () {}),
        ],
      ),
    );
  }
}
