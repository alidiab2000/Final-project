import 'package:final_project/core/helper/images.dart';
import 'package:final_project/core/themes/styles.dart';
import 'package:final_project/core/widgets/commen/custom_button.dart';
import 'package:final_project/features/auth/logic/cubit/authcubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationEmailScreen extends StatelessWidget {
  const VerificationEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final verifyCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              Image.asset(ImagesPath.verfiyEmail),
              SizedBox(height: 10.h),
              Text(
                "Check Your Email",
                style: TextStyles.font24GreenBold.copyWith(color: Colors.black),
              ),
              SizedBox(height: 10.h),
              Text(
                "Open Mail App to Verfiy",
                style: TextStyles.font14GrayRegular,
              ),
              SizedBox(height: 10.h),
              CustomButton(
                buttonText: "Continue",
                onPressed: () => verifyCubit.checkEmailVerified(),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    "Didn't receive the email?",
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () async => verifyCubit.sendEmailVerfication(),
                    child: Text(
                      "Click to resend",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
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
