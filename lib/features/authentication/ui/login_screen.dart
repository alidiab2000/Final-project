import 'package:final_project/core/themes/styles.dart';
import 'package:final_project/core/widgets/custom_button.dart';
import 'package:final_project/core/widgets/custom_text_field.dart';
import 'package:final_project/features/authentication/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Welcome Back',style: TextStyles.font24GreenBold,),
          Text("We're excited to have you back, can't wait to see what you've been up to since you last logged in.",style: TextStyles.font14GrayRegular),
          SizedBox(height:20.h),
          CustomTextField(hint:"Enter your name" , label: "Name"),
          SizedBox(height: 20.h),
                    CustomTextField(
            hint: "Enter your password",
            label: "Password",
            
          ),
SizedBox(height: 10.h),
TextButton(onPressed: (){}, child: Text("Forgot Password",style: TextStyles.font12BlackBold,),),
SizedBox(height: 10.h),
Row(
  children: [
  Checkbox(value: true, onChanged: (value){},),
  Text("Rember me", style: TextStyles.font12BlackBold,),

]),
SizedBox(height: 40.h),
CustomButton(buttonText: "Login", onPressed: (){},),
SizedBox(height: 10.h),
DividerSection(textDivider: "Or Sign in with"),
SizedBox(height: 10.h),


        ],
      ),
    );
  }
}