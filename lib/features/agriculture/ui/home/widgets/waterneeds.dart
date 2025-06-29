import 'package:final_project/core/helper/extensions.dart';
import 'package:final_project/core/router/router.dart';
import 'package:final_project/core/themes/styles.dart';
import 'package:final_project/features/agriculture/data/models/weather_api_model.dart';
import 'package:final_project/features/agriculture/ui/home/widgets/category_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaterNeedsCategory extends StatelessWidget {
  const WaterNeedsCategory({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryTitle(
                title: 'Water Needs',
                onTap: () {
                  context.pushNamed(
                    Routes.recommendationScreen,
                    arguments: weatherModel,
                  );
                },
              ),
            ],
          ),
        ),

        GestureDetector(
          onTap: () {
            context.pushNamed(
              Routes.recommendationScreen,
              arguments: weatherModel,
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.water_drop, color: Colors.blue, size: 35),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Calculate Water Usage',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Tap to enter crop & soil data',
                      style: TextStyles.font14GrayRegular,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
