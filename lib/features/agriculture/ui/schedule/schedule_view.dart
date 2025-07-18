import 'widgets/schedule_table.dart';
import 'package:flutter/material.dart';
import '../../../../core/themes/colors.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor:
            ColorsManager.maingreen, // You can change the color as neededط
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ScheduleTable()],
      ),
    );
  }
}
