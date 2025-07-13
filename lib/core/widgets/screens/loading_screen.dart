import '../../helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../loaders/animation_loader.dart';

class FullscreenLoader {
  static void openLoadingDialog(String? text, BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder:
          (_) => PopScope(
            canPop: false,
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 200.h),
                  AnimationLoader(text: text!),
                ],
              ),
            ),
          ),
    );
  }

  static stopLoading(BuildContext context) {
    context.pop();
  }
}
