// Date Cards List Widget
import 'package:final_project/features/agriculture/data/models/crops_recommendations_response/recommendation.dart';
import 'package:flutter/material.dart';
import 'date_card.dart';

class DateCardsList extends StatelessWidget {
  final List<Recommendation> dates;
  final double maxHeight;
  final Function(Recommendation) onRemoveDate;

  const DateCardsList({
    super.key,
    required this.dates,
    required this.maxHeight,
    required this.onRemoveDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: SingleChildScrollView(
        child: Column(
          children:
              dates
                  .map(
                    (data) => DateCard(
                      data: data,
                      onRemove: () => onRemoveDate(data),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
