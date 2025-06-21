import 'dart:math';

import 'package:final_project/core/themes/colors.dart';
import 'package:final_project/core/themes/styles.dart';
import 'package:final_project/features/agriculture/logic/weather_cubit/weather_cubit.dart';
import 'package:final_project/features/agriculture/ui/weather/widgets/details_weather_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/coming_weather.dart';
import 'widgets/weather_card.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().getWeather(cityname: "cairo");
  }

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
            // AppBar
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WeatherSuccess) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            children: [
                              SizedBox(height: 20.h),

                              WeaterCard(weatherModel: state.weatherModel),

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
                                            state
                                                .weatherModel
                                                .avgTempcomingday1!
                                                .toInt()
                                                .toString(),
                                      ),
                                      ComingWeather(
                                        dayName: DateTime.now()
                                            .add(const Duration(days: 1))
                                            .toString()
                                            .substring(0, 10),

                                        avgTemp:
                                            state
                                                .weatherModel
                                                .avgTempcomingday2!
                                                .toInt()
                                                .toString(),
                                      ),
                                      ComingWeather(
                                        dayName: DateTime.now()
                                            .add(const Duration(days: 2))
                                            .toString()
                                            .substring(0, 10),
                                        avgTemp:
                                            state
                                                .weatherModel
                                                .avgTempcomingday2!
                                                .toInt()
                                                .toString(),
                                      ),
                                      ComingWeather(
                                        dayName: DateTime.now()
                                            .add(const Duration(days: 2))
                                            .toString()
                                            .substring(0, 10),
                                        avgTemp:
                                            state
                                                .weatherModel
                                                .avgTempcomingday3!
                                                .toInt()
                                                .toString(),
                                      
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),

                              DetailsWeatherGridView(
                                weatherModel: state.weatherModel,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is WeatherFailed) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.black,
                          size: 80,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Something went wrong",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          state.error,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
