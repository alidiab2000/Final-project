import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/crop_image.dart';
import 'widgets/crops_details_sections.dart';

class CropInfoScreen extends StatelessWidget {
  const CropInfoScreen({super.key, required this.cropInfo});
  final Map<String, dynamic> cropInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //?? Crop Image and back button
            CropImage(cropInfo: cropInfo),
            SizedBox(height: 20.h),
            // Crop Details Section
            CropsDetailsSection(cropInfo: cropInfo),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
