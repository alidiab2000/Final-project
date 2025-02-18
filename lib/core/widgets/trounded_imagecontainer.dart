import 'package:final_project/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TroundedImageContainer extends StatelessWidget {
  const TroundedImageContainer({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 25.h,
        width: 20.w,

        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(50),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(46),

          child: Image(image: AssetImage(image)),
        ),
      ),
    );
  }
}
