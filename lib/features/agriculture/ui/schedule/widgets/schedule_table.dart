// Usage Example - ScheduleTable
import 'package:final_project/features/agriculture/ui/schedule/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleTable extends StatelessWidget {
  const ScheduleTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.h),
          Center(
            child: DatePickerWidget(
              onDatesChanged: (dates) {
                debugPrint('Selected dates: $dates');
              },
              firstDate: DateTime(2021),
              lastDate: DateTime(2030),
              maxHeight: 400,
            ),
          ),
        ],
      ),
    );
  }
}
