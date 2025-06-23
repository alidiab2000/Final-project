import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/app_regex.dart';
import '../../../../../core/widgets/commen/custom_text_field.dart';
import '../../../logic/cubit/authcubit.dart';
import 'reset_button.dart';
import 'title_and_text.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().forgetPasswordFormKey,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Flexible(
                child: TitleAndText(
                  title: 'Forget Password',
                  text:
                      "At our app, we take the security of your information seriously.",
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          CustomTextField(
            hint: "Enter your Email",
            label: "Email",
            validator:
                (email) =>
                    (email == null || email.isEmpty)
                        ? 'Please enter your email'
                        : (AppRegex.isEmailValid(email)
                            ? null
                            : 'Please enter a valid email'),

            controller: context.read<AuthCubit>().forgetPasswordemailController,
          ),
          SizedBox(height: 20),
          ResetButton(),
        ],
      ),
    );
  }
}
