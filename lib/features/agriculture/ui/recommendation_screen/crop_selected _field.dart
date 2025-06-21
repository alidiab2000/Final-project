import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/recommendation_cubit/recommendations_cubit.dart';

class CropSelectedField extends StatelessWidget {
  const CropSelectedField({super.key, required this.cubit});

  final RecommendationsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(
            "Crop",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff1E640A),
            ),
          ),
          SizedBox(
            width: 140.w,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Crop',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
              items: const [
                DropdownMenuItem(value: 'rice', child: Text('Rice')),
                DropdownMenuItem(value: 'maize', child: Text('Maize')),
                DropdownMenuItem(value: 'banana', child: Text('Banana')),
                DropdownMenuItem(
                  value: 'watermelon',
                  child: Text('Watermelon'),
                ),
                DropdownMenuItem(value: 'cotton', child: Text('Cotton')),
              ],
              onChanged: (value) {
                cubit.selectedCrop = value ?? '';
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Plz select a crop';
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
