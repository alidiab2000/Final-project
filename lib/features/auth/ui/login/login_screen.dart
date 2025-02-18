import 'package:final_project/core/helper/extensions.dart';
import 'package:final_project/core/router/router.dart';
import 'package:final_project/core/themes/styles.dart';
import 'package:final_project/core/widgets/custom_button.dart';
import 'package:final_project/core/widgets/custom_text_field.dart';
import 'package:final_project/core/widgets/trounded_imagecontainer.dart';
import 'package:final_project/features/auth/ui/login/widgets/login_form.dart';
import 'package:final_project/features/auth/ui/login/widgets/social_mediasection.dart';
import 'package:final_project/features/auth/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome Back', style: TextStyles.font24GreenBold),
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.font14GrayRegular,
              ),
              SizedBox(height: 20.h),
              LoginForm(),

              SizedBox(height: 10.h),
              DividerSection(textDivider: "Or Sign in with"),
              SizedBox(height: 10.h),

              ScoialMediaIcons(),

              SizedBox(height: 20.h),
              
              Row(
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 16.sp, color: Color(0xffB08263)),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushNamed( Routes.register);
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

