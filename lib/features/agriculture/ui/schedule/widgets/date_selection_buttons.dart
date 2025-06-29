// Date Selection Buttons Widget
import 'package:flutter/material.dart';

class DateSelectionButtons extends StatelessWidget {
  final VoidCallback onSelectDate;
  final VoidCallback onSelectDateRange;

  const DateSelectionButtons({
    super.key,
    required this.onSelectDate,
    required this.onSelectDateRange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onSelectDate,
            icon: const Icon(Icons.calendar_today),
            label: const Text('One Day'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: OutlinedButton.icon(
            onPressed: onSelectDateRange,
            icon: const Icon(Icons.date_range),
            label: const Text('Range of Days'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }
}
