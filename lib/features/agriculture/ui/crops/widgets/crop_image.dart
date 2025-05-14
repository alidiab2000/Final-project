import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/images.dart';

class CropImage extends StatelessWidget {
  const CropImage({super.key, required this.cropInfo});

  final Map<String, dynamic> cropInfo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .4,
              child: Image.asset(ImagesPath.curveImage, fit: BoxFit.fill),
            ),
            Positioned(
              bottom: -10,
              left: 80.sp,
              child: SizedBox(
                width: 200.sp,
                height: 200.sp,
                child: Image.asset(cropInfo["image"]),
              ),
            ),
          ],
        ),

        Positioned(
          top: 30,
          left: 10,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(
                alpha: 0.6,
              ), // دائرة بلون أبيض شفاف
            ),
            padding: EdgeInsets.all(12),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black87, size: 24),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }
}
