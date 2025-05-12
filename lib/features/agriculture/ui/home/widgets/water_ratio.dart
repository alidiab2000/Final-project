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
          CategoryTitle(title: "Water Ratio", onTap: () {}),
          SizedBox(height: 10.h),
          Text("Monitor your farmland", style: TextStyles.font14GrayRegular),
          // TODO : Add water ratio chart 
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
