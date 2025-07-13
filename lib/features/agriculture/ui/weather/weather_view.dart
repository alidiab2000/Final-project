import '../../../../core/themes/colors.dart';
import '../../../../core/themes/styles.dart';
import '../../data/models/weather_api_model.dart';
import 'widgets/details_weather_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/coming_weather.dart';
import 'widgets/weather_card.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key, this.weatherData});

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.maingreen,
        title: Text("Weather", style: TextStyles.font20WhiteBold),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (weatherData == null)
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, color: Colors.black, size: 80),
                    SizedBox(height: 16),
                    Text(
                      "No weather data available",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Please check your location settings",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              )
            else
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),

                          WeaterCard(weatherModel: weatherData!),

                          // Weather next days
                          SizedBox(height: 20.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Next Days",
                                style: TextStyles.font20BlackBold,
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ComingWeather(
                                    dayName: DateTime.now()
                                        .toString()
                                        .substring(0, 10),
                                    avgTemp:
                                        weatherData!.avgTempcomingday1 != null
                                            ? weatherData!.avgTempcomingday1!
                                                .toInt()
                                                .toString()
                                            : "N/A",
                                  ),
                                  ComingWeather(
                                    dayName: DateTime.now()
                                        .add(const Duration(days: 1))
                                        .toString()
                                        .substring(0, 10),
                                    avgTemp:
                                        weatherData!.avgTempcomingday2 != null
                                            ? weatherData!.avgTempcomingday2!
                                                .toInt()
                                                .toString()
                                            : "N/A",
                                  ),
                                  ComingWeather(
                                    dayName: DateTime.now()
                                        .add(const Duration(days: 2))
                                        .toString()
                                        .substring(0, 10),
                                    avgTemp:
                                        weatherData!.avgTempcomingday3 != null
                                            ? weatherData!.avgTempcomingday3!
                                                .toInt()
                                                .toString()
                                            : "N/A",
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),

                          DetailsWeatherGridView(weatherModel: weatherData!),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
