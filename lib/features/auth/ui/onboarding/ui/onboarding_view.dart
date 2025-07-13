import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/helper/extensions.dart';
import '../../../../../core/helper/images.dart';
import '../../../../../core/router/router.dart';
import '../../../../../core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/widgets/commen/custom_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 100.h),
                Lottie.asset(
                  ImagesPath.onboardingAnimated,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  width: double.infinity,
                ),
                SizedBox(height: 50.h),
                Text('Emaar El-Ard', style: TextStyles.font46GreenBold),
                SizedBox(height: 50.h),
                CustomButton(
                  buttonText: "Get Started",
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    const String isFirstTimeKey = "isFirstTime";
                    await prefs.setBool(isFirstTimeKey, false);
                    if (context.mounted) {
                      context.pushReplacementNamed(Routes.login);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
