import '../../../../../core/helper/extensions.dart';
import 'weather_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/router/router.dart';
import '../../../../../core/themes/colors.dart';
import 'category_title.dart';
import '../../../../agriculture/data/models/weather_api_model.dart';
import '../../../../agriculture/logic/navigationbar_cubit/naviagtionbar_cubit.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key, this.weatherData});
  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryTitle(
                title: "Weather",
                onTap:
                    () => context.pushNamed(
                      Routes.weatherView,
                      arguments: weatherData,
                    ),
              ),
              // Refresh button
              IconButton(
                onPressed: () async {
                  await context.read<NaviagtionbarCubit>().refreshWeatherData();
                  // Navigate to WeatherView with updated data
                  if (context.mounted) {
                    context.pushNamed(
                      Routes.weatherView,
                      arguments: context.read<NaviagtionbarCubit>().weatherData,
                    );
                  }
                },
                icon: const Icon(Icons.refresh, color: ColorsManager.maingreen),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  WeatherCard(
                    icon: Icons.wb_sunny,
                    title: DateTime.now().toString().substring(0, 10),
                    details: "${weatherData?.avgTempcomingday1 ?? 30}  °C",
                  ),
                  SizedBox(width: 10.w),
                  WeatherCard(
                    icon: Icons.cloud_circle,
                    title: DateTime.now()
                        .add(const Duration(days: 1))
                        .toString()
                        .substring(0, 10),
                    details: "${weatherData?.avgTempcomingday2 ?? 30}  °C",
                  ),
                  SizedBox(width: 10.w),
                  WeatherCard(
                    icon: Icons.sunny_snowing,
                    title: DateTime.now()
                        .add(const Duration(days: 2))
                        .toString()
                        .substring(0, 10),
                    details: "${weatherData?.avgTempcomingday3 ?? 30}  °C",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
