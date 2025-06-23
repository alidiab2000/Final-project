import 'package:final_project/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/colors.dart';
import 'category_title.dart';

class FiledsCategory extends StatelessWidget {
  const FiledsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryTitle(
            title: "Fields",
            onTap: () {
           
              // You can use Navigator.push or any other navigation method you prefer
            },
          ),
          Text("Monitor your farmland", style: TextStyles.font14GrayRegular),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FieldCropCategory(
                fieldName: "Agricultural",
                fieldDetails: "Rice",
              ),
              FieldCropCategory(
                fieldName: "Agricultural",
                fieldDetails: "Cotton",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FieldCropCategory extends StatelessWidget {
  const FieldCropCategory({
    super.key,
    required this.fieldName,
    required this.fieldDetails,
  });
  final String fieldName;
  final String fieldDetails;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 100.h,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ColorsManager.grayWithOpacity,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            fieldName,
            style: TextStyles.font14BlackRegular.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            padding: const EdgeInsets.all(8),
            width: 120.w,

            decoration: BoxDecoration(
              color: ColorsManager.maingreen.withValues(alpha: .5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1),
            ),
            child: Text(
              fieldDetails, // Replace with actual field details
              textAlign: TextAlign.center,
              style: TextStyles.font14BlackRegular,
            ),
          ),
        ],
      ),
    );
  }
}
