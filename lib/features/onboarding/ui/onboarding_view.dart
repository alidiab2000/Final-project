import 'package:final_project/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomTextField(
          hint: "Enter your name",
          label: "Name",
          controller: TextEditingController(),
        ),
      ),
    );
  }
}
