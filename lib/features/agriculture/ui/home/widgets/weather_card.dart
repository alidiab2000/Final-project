import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/colors.dart';
import '../../../../../core/themes/styles.dart';

class WeatherCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String details;

  const WeatherCard({
    super.key,
    required this.icon,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 150.h,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.grayWithOpacity,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyles.font12BlackBold),
          const SizedBox(height: 5),
          Icon(icon, size: 30.sp, color: Colors.yellow),
          const SizedBox(height: 5),
          Text(details, style: TextStyles.font14GrayRegular),
        ],
      ),
    );
  }
}
