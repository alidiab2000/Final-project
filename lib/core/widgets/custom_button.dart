import 'package:final_project/core/themes/colors.dart';
import 'package:final_project/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonText, this.onPressed});
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          height: 45.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManager.maingreen,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: onPressed,
              child: Center(
                child: Text(buttonText, style: TextStyles.font20WhiteBold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
