import 'package:final_project/core/helper/extensions.dart';
import 'package:final_project/core/router/router.dart';
import 'package:final_project/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../core/widgets/commen/custom_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 100.h),
              Lottie.asset(
                'assets/images/Animation - 1739830703663.json',
                height: MediaQuery.sizeOf(context).height * 0.4,
                width: double.infinity,
              ),
              SizedBox(height: 50.h),
              Text('Emaar El-Ard', style: TextStyles.font46GreenBold),
              SizedBox(height: 50.h),
              CustomButton(
                buttonText: "Get Started",
                onPressed: () {
                  context.pushReplacementNamed(Routes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
