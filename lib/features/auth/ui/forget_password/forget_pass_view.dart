import '../../../../core/helper/extensions.dart';
import '../../../../core/router/router.dart';
import '../../../../core/widgets/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../logic/cubit/authcubit.dart';
import 'widgets/forget_password_form.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is ForgetPasswordFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
                if (state is ForgetPasswordSuccess) {
                  // Delayed navigation
                  FullscreenLoader.stopLoading(context);
                  context.pushNamed(Routes.login);
                }
              },
              child: ForgetPasswordForm(),
            ),
          ),
        ),
      ),
    );
  }
}
