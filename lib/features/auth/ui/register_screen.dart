import 'package:final_project/core/themes/styles.dart';
import 'package:final_project/core/widgets/custom_button.dart';
import 'package:final_project/core/widgets/custom_text_field.dart';
import 'package:final_project/core/widgets/trounded_imagecontainer.dart';
import 'package:final_project/features/auth/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create Account', style: TextStyles.font24GreenBold),
              Text(
                "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                style: TextStyles.font14GrayRegular,
              ),
              SizedBox(height: 20.h),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(hint: "Enter your name", label: "Name"),

                    SizedBox(height: 20.h),
                    CustomTextField(hint: "Email/Phone Number", label: "Email"),
                     SizedBox(height: 20.h),
                    CustomTextField(
                      hint: "Enter your password",
                      label: "Password",
                    ),
                    
                     SizedBox(height: 20.h),
                    CustomTextField(
                      hint: "Confirm password",
                      label: "Password",
                    ),
                    
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        Text("Rember me", style: TextStyles.font12BlackBold),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    CustomButton(buttonText: "Create Account", onPressed: () {}),
                  ],
                ),
              ),

              SizedBox(height: 10.h),
              DividerSection(textDivider: "Or Sign in with"),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TroundedImageContainer(
                    image: "assets/images/goegle_logo.png",
                  ),
                  SizedBox(width: 20.w),
                  TroundedImageContainer(
                    image: "assets/images/facebook_logo.png",
                  ),
                  SizedBox(width: 20.w),
                  TroundedImageContainer(image: "assets/images/apple_logo.png"),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    "Already have an account",
                    style: TextStyle(fontSize: 16.sp, color: Color(0xffB08263)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Log in",
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