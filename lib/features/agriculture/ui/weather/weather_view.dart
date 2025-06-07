import 'package:final_project/core/themes/colors.dart';
import 'package:final_project/core/themes/styles.dart';
import 'package:final_project/features/agriculture/ui/home/widgets/weather_details.dart';
import 'package:final_project/features/agriculture/ui/weather/logic/cubit/weather_cubit.dart';
import 'package:final_project/features/agriculture/ui/weather/widgets/coming_weather_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/coming_weather.dart';
import 'widgets/weather_card.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.maingreen,
        title: Text("Weather", style: TextStyles.font20WhiteBold),
        centerTitle: true,
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          }else if(state is WeatherSuccess){
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
          }else if (state is WeatherFailed){
            return Center(child: Text(state.error),);
          }else{
            return Container();
          }
         
        },
      ),
    );
  }
}
