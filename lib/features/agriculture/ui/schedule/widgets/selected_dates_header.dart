
// Selected Dates Header Widget
import 'package:flutter/material.dart';

class SelectedDatesHeader extends StatelessWidget {
  final int dateCount;
  final VoidCallback onClearAll;

  const SelectedDatesHeader({
    super.key,
    required this.dateCount,
    required this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Selected Dates ($dateCount)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        TextButton(
          onPressed: onClearAll,
          child: const Text('Clear All'),
        ),
      ],
    );
  }
}