import '../../helper/images.dart';
import '../../themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AnimationLoader extends StatelessWidget {
  const AnimationLoader({
    super.key,
    required this.text,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(
            ImagesPath.loaderAnimated,
            width: MediaQuery.sizeOf(context).width * 0.8,
          ),
          const SizedBox(height: 20),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          showAction
              ? SizedBox(
                width: 200,
                child: OutlinedButton(
                  onPressed: onActionPressed,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: ColorsManager.maingreen,
                  ),
                  child: Text(
                    actionText!,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: ColorsManager.maingreen,
                    ),
                  ),
                ),
              )
              : const SizedBox(),
        ],
      ),
    );
  }
}
