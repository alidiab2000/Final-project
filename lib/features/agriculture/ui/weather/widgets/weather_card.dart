import 'package:final_project/features/agriculture/data/models/weather_api_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/images.dart';
import '../../../../../core/themes/styles.dart';

class WeaterCard extends StatelessWidget {
  const WeaterCard({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffF4FFF1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Now", style: TextStyles.font22BlackRegular),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weatherModel.avgTemp.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1,
                    ),
                  ),
                  Image.asset(ImagesPath.cloudWeather, width: 70.w),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                "High: ${weatherModel.maxTemp!.toInt()} | Low: ${weatherModel.minTemp!.toInt()}°",
                style: TextStyles.font14GrayRegular,
              ),
            ],
          ),
          SizedBox(width: 20.w),
          Column(
            children: [
              Text(
                weatherModel.weatherstate!,
                style: TextStyles.font20BlackBold,
              ),
              SizedBox(height: 10.h),
              Text(
                "Feels like ${weatherModel.feelsLike!.toInt()}°",
                style: TextStyles.font14GrayRegular,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
