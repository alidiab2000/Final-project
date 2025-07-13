import '../../../../../core/helper/extensions.dart';
import '../../../../../core/helper/images.dart';
import '../../../../../core/router/router.dart';
import '../../../../../core/themes/styles.dart';
import '../../../data/models/weather_api_model.dart';
import 'category_title.dart';
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
            //height: MediaQuery.of(context).size.height * 0.2,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.water_drop, color: Colors.blue, size: 20),

                Flexible(
                  child: Column(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(ImagesPath.waterNedds, width: 60.w),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
