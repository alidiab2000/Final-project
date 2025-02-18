import 'package:final_project/core/helper/extensions.dart';
import 'package:final_project/core/router/router.dart';
import 'package:final_project/core/widgets/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                  FullscreenLoader.stopLoading(context);
                  //TODO : Make navigation to login page
                  context.pushNamed(Routes.home);
                }
                if (state is ForgetPasswordLoading) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Sending email...'),
                      backgroundColor: Colors.green,
                    ),
                  );
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
