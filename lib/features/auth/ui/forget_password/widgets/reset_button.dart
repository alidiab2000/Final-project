import '../../../../../core/widgets/commen/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/authcubit.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      buttonText: 'Reset Password',
      onPressed: () {
        context.read<AuthCubit>().sendPasswordResetEmail(context);
      },
    );
  }
}
