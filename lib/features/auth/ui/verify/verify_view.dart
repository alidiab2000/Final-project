import '../../../../core/helper/extensions.dart';
import '../../../../core/helper/images.dart';
import '../../../../core/router/router.dart';
import '../../../../core/themes/styles.dart';

import '../../../../core/widgets/popups/snakbars.dart';
import '../../logic/cubit/authcubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationEmailScreen extends StatefulWidget {
  const VerificationEmailScreen({super.key});

  @override
  State<VerificationEmailScreen> createState() =>
      _VerificationEmailScreenState();
}

class _VerificationEmailScreenState extends State<VerificationEmailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().sendEmailVerfication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is EmailVerficationSuccess) {
                showDialog(
                  context: context,
                  
                  builder:
                      (_) => PopScope(
                        child: AlertDialog(
                          content: Text("Email Verfication Success"),
                        ),
                  
                      ),
                      
                );
                Future.delayed(const Duration(seconds: 2));
                context.pushReplacementNamed(Routes.navigationBarMenu);
              } else if (state is EmailVerficationFailed) {
                CustomSnakbars.errorSnackBar(context, title: state.error);
              }
            },
            child: Column(
              children: [
                Image.asset(ImagesPath.verfiyEmail),
                SizedBox(height: 10.h),

                Text(
                  "Check Your Email",
                  style: TextStyles.font24GreenBold.copyWith(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),

                Text(
                  "Open Mail App to Verfiy",
                  style: TextStyles.font14GrayRegular,
                ),
                SizedBox(height: 20.h),

                Row(
                  children: [
                    Text(
                      "Didn't receive the email?",
                      style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<AuthCubit>().sendEmailVerfication();
                      },
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
      ),
    );
  }
}
