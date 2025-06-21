import 'package:final_project/features/agriculture/data/models/weather_api_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/images.dart';
import '../../../../../core/themes/styles.dart';

class DetailsWeatherGridView extends StatelessWidget {
  const DetailsWeatherGridView({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    final List weatherDetails = [
      {
        "title": "Wind Speed",
        "image": ImagesPath.air,
        "value": "${weatherModel.windSpeed!.toInt()}Km/hr",
      },
      {
        "title": "Precipitation",
        "image": ImagesPath.rain,
        "value": "${weatherModel.totalPercipitation!.toInt()}%",
      },
      {
        "title": "Sunrise/Sunset",
        "image": ImagesPath.sunrise,
        "value": "${weatherModel.sunrise} / ${weatherModel.sunset}",
      },
      {
        "title": "Humidity",
        "image": ImagesPath.humidity,
        "value": "${weatherModel.humidity}%",
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 4,
      itemBuilder:
          (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: Container(
              padding: EdgeInsets.all(12),
              height: 80.h,

              decoration: BoxDecoration(
                //border: Border.all(color: Colors.grey, width: 0.5),
                color: Color(0xffF4FFF1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Image.asset(weatherDetails[index]["image"], width: 40.w),
                  SizedBox(width: 5.w),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weatherDetails[index]["title"],
                          style: TextStyles.font20BlackBold.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          weatherDetails[index]["value"],
                          style: TextStyles.font14BlackRegular,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
