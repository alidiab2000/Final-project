import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleTable extends StatelessWidget {
  const ScheduleTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 10)),
            lastDate: DateTime.now().add(const Duration(days: 1000)),
            onDateChanged: (DateTime date) {
              debugPrint(
                "Selected date: ${date.toLocal().toString().substring(0, 10)}",
              );
            },
          ),
        ],
      ),
    );
  }
}
