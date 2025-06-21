import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/recommendation_cubit/recommendations_cubit.dart';

class RainfallYesNo extends StatelessWidget {
  const RainfallYesNo({super.key, required this.cubit});

  final RecommendationsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Rainfall",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff1E640A),
            ),
          ),
          SizedBox(
            width: 140.w,
            child: DropdownButtonFormField<bool>(
              items: [
                DropdownMenuItem(value: true, child: Text('Yes')),
                DropdownMenuItem(value: false, child: Text('No')),
              ],
              onChanged: (value) {
                cubit.rainfall = value ?? false;
              },
              decoration: InputDecoration(
                labelText: 'Rainfall',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
              validator: (value) {
                if (value == null) {
                  return 'Plz select an option';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
