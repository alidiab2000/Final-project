import 'package:final_project/core/helper/extensions.dart';
import 'package:final_project/core/router/router.dart';
import 'package:final_project/core/themes/styles.dart';
import 'package:final_project/features/agriculture/ui/home/widgets/category_title.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaterRatio extends StatelessWidget {
  const WaterRatio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryTitle(
            title: "Water Ratio",
            onTap: () => context.pushNamed(Routes.recommendationScreen),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 200.h,
            child: LineChart(
              LineChartData(
                minY: 0,
                maxY: 2000,
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        switch (value.toInt()) {
                          case 0:
                            return Text(
                              'Nov',
                              style: TextStyles.font12GrayRegular,
                            );
                          case 1:
                            return Text(
                              'Dec',
                              style: TextStyles.font12GrayRegular,
                            );
                          case 2:
                            return Text(
                              'Jan',
                              style: TextStyles.font12GrayRegular,
                            );
                          case 3:
                            return Text(
                              'Feb',
                              style: TextStyles.font12GrayRegular,
                            );
                          case 4:
                            return Text(
                              'Mar',
                              style: TextStyles.font12GrayRegular,
                            );
                          default:
                            return SizedBox.shrink();
                        }
                      },
                      interval: 1,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 500,
                      getTitlesWidget:
                          (value, _) => Text(
                            value.toInt().toString(),
                            style: TextStyles.font12GrayRegular,
                          ),
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(show: true, horizontalInterval: 500),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 1200),
                      FlSpot(1, 1500),
                      FlSpot(2, 1000),
                      FlSpot(3, 1700),
                      FlSpot(4, 900),
                    ],
                    isCurved: true,
                    color: Colors.blueAccent,
                    barWidth: 3,
                    dotData: FlDotData(show: true),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.blueAccent.withValues(alpha: 0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //MonthlyLineChart(),
        ],
      ),
    );
  }
}

class MonthlyLineChart extends StatelessWidget {
  const MonthlyLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minY: -1600,
        maxY: 0,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                switch (value.toInt()) {
                  case 0:
                    return Text('NOV');
                  case 1:
                    return Text('DEC');
                  case 2:
                    return Text('JAN');
                  case 3:
                    return Text('FEB');
                  case 4:
                    return Text('MAR');
                  default:
                    return SizedBox.shrink();
                }
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 500,
              getTitlesWidget: (value, _) => Text(value.toInt().toString()),
            ),
          ),
        ),
        gridData: FlGridData(show: true),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            spots: [
              FlSpot(0, -1500),
              FlSpot(1, -800),
              FlSpot(2, -750),
              FlSpot(3, -100),
              FlSpot(4, -500),
            ],
            barWidth: 4,
            color: Colors.blue,
            dotData: FlDotData(show: true),
          ),
        ],
      ),
    );
  }
}
