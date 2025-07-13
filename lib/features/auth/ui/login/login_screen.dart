import '../../../../core/helper/extensions.dart';
import '../../../../core/router/router.dart';
import '../../../../core/themes/styles.dart';
import '../../../../core/widgets/functions/check_login_user.dart';
import '../../../../core/widgets/popups/snakbars.dart';
import '../../logic/cubit/authcubit.dart';
import 'widgets/login_form.dart';
import 'widgets/social_mediasection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/commen/divider.dart';
import '../../../../core/widgets/screens/loading_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) async {
                if (state is LoginFailed) {
                  FullscreenLoader.stopLoading(context);
                  CustomSnakbars.errorSnackBar(context, title: state.error);
                }
                if (state is LoginSuccess) {
                  // Delayed navigation
                  FullscreenLoader.stopLoading(context);
                  CustomSnakbars.successSnackBar(
                    context,
                    title: "Login Successful",
                    message: "Welcome back! ",
                  );
                  String nextRoute = await checkIfLoggedInAndVerfiedUser();
                  if (context.mounted) {
                    context.pushReplacementNamed(
                      nextRoute,
                    );
                  }
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Log In', style: TextStyles.font24GreenBold),
                  Text(
                    "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                    style: TextStyles.font14GrayRegular,
                  ),
                  SizedBox(height: 20.h),
                  LoginForm(),

                  SizedBox(height: 15.h),
                  DividerSection(textDivider: "Or Sign in with"),
                  SizedBox(height: 15.h),

                  ScoialMediaIcons(),

                  SizedBox(height: 20.h),

                  Row(
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          context.pushNamed(Routes.register);
                        },
                        child: Text(
                          "Sign Up",

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
