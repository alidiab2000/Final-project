// Date Info Widget (Day/Month/Year display or any label/value pair)
// This widget is generic and can be used for any label/value, not just dates.
import 'package:flutter/material.dart';

class DateInfo extends StatelessWidget {
  final String label;
  final String value;
  final double fontSize;
  final CrossAxisAlignment alignment;

  const DateInfo({
    super.key,
    required this.label,
    required this.value,
    required this.fontSize,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
