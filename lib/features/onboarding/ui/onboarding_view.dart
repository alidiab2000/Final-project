import 'package:final_project/core/themes/styles.dart';
import 'package:final_project/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Lottie.asset('assets/images/Animation - 1739830703663.json'),

            Text('Emaar El-Ard', style: TextStyles.font46GreenBold),
            SizedBox(height: 50.h),
            CustomButton(buttonText: "Get Started", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
