import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedImageContainer extends StatelessWidget {
  const RoundedImageContainer({super.key, required this.image, this.onTap});
  final String image;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 50.w,

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
