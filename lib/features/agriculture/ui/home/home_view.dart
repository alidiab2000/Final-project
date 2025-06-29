// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:final_project/core/themes/colors.dart';
import 'package:final_project/features/agriculture/ui/home/widgets/title_container.dart';
import 'package:final_project/features/agriculture/ui/home/widgets/waterneeds.dart';
import 'package:final_project/features/agriculture/data/models/weather_api_model.dart';

import 'widgets/weather_details.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.userName, this.weatherData});
  final String userName;
  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleContainer(userName: userName),
            divider(),
            WeatherDetails(weatherData: weatherData),
            divider(),
            WaterNeedsCategory(
              weatherModel: weatherData!,
            ),
          ],
        ),
      ),
    );
  }
}

Widget divider() => const Divider(
  height: 1,
  thickness: 1,
  color: ColorsManager.grayWithOpacity,
);
