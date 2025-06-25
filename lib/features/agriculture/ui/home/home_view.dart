import 'package:final_project/core/themes/colors.dart';
import 'package:final_project/features/agriculture/ui/home/widgets/title_container.dart';
import 'package:final_project/features/agriculture/ui/home/widgets/waterneeds.dart';
import 'package:flutter/material.dart';
import 'widgets/fileds_category.dart';
import 'widgets/weather_details.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleContainer(),
            divider(),
             WeatherDetails(),
            divider(),
            WaterNeedsCategory(),
           
            
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
