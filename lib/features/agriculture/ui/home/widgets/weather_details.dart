import 'package:final_project/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/router/router.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/themes/styles.dart';
import 'category_title.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          CategoryTitle(
            title: "Weather",
            onTap: () => context.pushNamed(Routes.weatherView),
          ),
          const SizedBox(height: 10),
          SizedBox(
            child: Wrap(
              spacing: 10.w,
              children: [
                WeatherCard(
                  icon: Icons.wb_sunny,
                  title: "Temperature",
                  details: "25°C",
                ),
                SizedBox(width: 10.w),
                WeatherCard(
                  icon: Icons.water_drop,
                  title: "Humidity",
                  details: "60%",
                ),
                SizedBox(width: 10.w),
                WeatherCard(
                  icon: Icons.air,
                  title: "Wind Speed",
                  details: "15 km/h",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
          Icon(icon, size: 30.sp, color: ColorsManager.maingreen),
          const SizedBox(height: 5),
          Text(title, style: TextStyles.font12BlackBold),
          const SizedBox(height: 5),
          Text(details, style: TextStyles.font14GrayRegular),
        ],
      ),
    );
  }
}
