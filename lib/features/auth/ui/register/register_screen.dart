import 'package:final_project/core/helper/extensions.dart';
import 'package:final_project/core/themes/styles.dart';
import 'package:final_project/features/auth/logic/cubit/authcubit.dart';
import 'package:final_project/features/auth/ui/forget_password/widgets/title_and_text.dart';
import 'package:final_project/features/auth/ui/login/widgets/social_mediasection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/router/router.dart';
import '../../../../core/widgets/commen/custom_button.dart';
import '../../../../core/widgets/commen/custom_text_field.dart';
import '../../../../core/widgets/commen/divider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleAndText(
                    title: "Create Account",
                    text:
                        "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                  ),
                  SizedBox(height: 20.h),
                  Form(
                    key: context.read<AuthCubit>().registerFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          hint: "Enter your name",
                          label: "Name",
                          controller:
                              context.read<AuthCubit>().registerNameController,
                        ),

                        SizedBox(height: 20.h),
                        CustomTextField(
                          hint: "Email/Phone Number",
                          label: "Email",
                          controller:
                              context.read<AuthCubit>().registerEmailController,
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          hint: "Enter your password",
                          label: "Password",
                          controller:
                              context
                                  .read<AuthCubit>()
                                  .registerPasswordController,
                        ),

                        SizedBox(height: 20.h),
                        CustomTextField(
                          hint: "Password",
                          label: "Confirm Password",
                          controller:
                              context
                                  .read<AuthCubit>()
                                  .registerConfirmPasswordController,
                        ),

                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            Text(
                              "Rember me",
                              style: TextStyles.font12BlackBold,
                            ),
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
                  ),

                  SizedBox(height: 10.h),
                  DividerSection(textDivider: "Or Sign up with"),
                  SizedBox(height: 10.h),
                  ScoialMediaIcons(),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Text(
                        "Already have an account",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                      TextButton(
                        onPressed:
                            () => context.pushReplacementNamed(Routes.login),
                        child: Text(
                          "Log in",
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
      ),
    );
  }
}
