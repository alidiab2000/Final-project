import 'package:final_project/core/themes/colors.dart';
import 'package:final_project/core/themes/styles.dart';
import 'package:final_project/features/agriculture/ui/home/widgets/coming_weather_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/coming_weather.dart';
import 'widgets/weather_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 8, left: 8),
            height: 50.h,
            decoration: BoxDecoration(color: ColorsManager.maingreen),
            child: Text(
              "Zagazig, Sharkia",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SizedBox(height: 20.h),

                WeaterCard(),

                // Weather next days
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Next Days", style: TextStyles.font20BlackBold),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ComingWeather(),
                        ComingWeather(),
                        ComingWeather(),
                        ComingWeather(),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                ComingWeatherGridView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
