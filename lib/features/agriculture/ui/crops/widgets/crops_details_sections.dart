import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'crop_container.dart';

class CropsDetailsSection extends StatelessWidget {
  const CropsDetailsSection({super.key, required this.cropInfo});

  final Map<String, dynamic> cropInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "crop info :",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            cropInfo["name"],
            style: TextStyle(
              color: Colors.black,
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            cropInfo["description"],
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CropContainer(
                icon: Icons.water_drop,
                title: cropInfo["waterAmount"],
              ),
              CropContainer(icon: Icons.sunny, title: cropInfo["temperature"]),
              CropContainer(icon: Icons.water, title: cropInfo["soilType"]),
            ],
          ),
        ],
      ),
    );
  }
}
