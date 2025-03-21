import 'package:final_project/core/helper/extensions.dart';
import 'package:final_project/core/widgets/popups/snakbars.dart';
import 'package:final_project/features/auth/logic/cubit/authcubit.dart';
import 'package:final_project/features/auth/ui/forget_password/widgets/title_and_text.dart';
import 'package:final_project/features/auth/ui/login/widgets/social_mediasection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/router/router.dart';
import '../../../../core/widgets/commen/divider.dart';
import '../../../../core/widgets/screens/loading_screen.dart';
import 'widgets/register_form.dart';

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
                if (state is RegisterFailed) {
                  FullscreenLoader.stopLoading(context);
                  CustomSnakbars.errorSnackBar(context, title: state.error);
                }
                if (state is RegisterSuccess) {
                  // Delayed navigation
                  FullscreenLoader.stopLoading(context);
                  context.pushReplacementNamed(Routes.login);
                }
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

                  // Register Form for sign up
                  RegisterForm(),

                  SizedBox(height: 10.h),
                  DividerSection(textDivider: "Or Sign up with"),
                  SizedBox(height: 10.h),
                  // Scoial Media Icons for sign up
                  ScoialMediaIcons(),
                  SizedBox(height: 20.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Log in",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap =
                                    () => context.pushReplacementNamed(
                                      Routes.login,
                                    ),
                        ),
                      ],
                    ),
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
