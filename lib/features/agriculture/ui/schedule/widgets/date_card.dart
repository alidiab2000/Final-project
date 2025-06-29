// Individual Date Card Widget
import 'package:final_project/features/agriculture/data/models/crops_recommendations_response/recommendation.dart';
import 'package:flutter/material.dart';
import 'date_info.dart';
import 'remove_button.dart';

class DateCard extends StatelessWidget {
  final Recommendation data;
  final VoidCallback onRemove;

  const DateCard({super.key, required this.data, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor.withValues(alpha: 0.1),
              Theme.of(context).primaryColor.withValues(alpha: 0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateInfo(
                  label: 'Area',
                  value: data.area.toString(),
                  fontSize: 16,
                  alignment: CrossAxisAlignment.start,
                ),
                DateInfo(
                  label: 'Crop',
                  value: data.cropName,
                  fontSize: 16,
                  alignment: CrossAxisAlignment.center,
                ),
                DateInfo(
                  label: 'Date',
                  value: data.date,
                  fontSize: 14,
                  alignment: CrossAxisAlignment.center,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateInfo(
                  label: 'Temp',
                  value: data.temperature.toString(),
                  fontSize: 14,
                  alignment: CrossAxisAlignment.center,
                ),
                DateInfo(
                  label: 'Total Water',
                  value: data.totalWaterUsage,
                  fontSize: 14,
                  alignment: CrossAxisAlignment.center,
                ),
                DateInfo(
                  label: 'Per sqm',
                  value: data.waterUsagePerSqm,
                  fontSize: 14,
                  alignment: CrossAxisAlignment.end,
                ),
              ],
            ),
            RemoveButton(onPressed: onRemove),
          ],
        ),
      ),
    );
  }
}
