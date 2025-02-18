import 'package:final_project/core/helper/images.dart';
import 'package:final_project/core/widgets/trounded_imagecontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScoialMediaIcons extends StatelessWidget {
  const ScoialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TroundedImageContainer(image:ImagesPath.googleLogo),
        SizedBox(width: 20.w),
        TroundedImageContainer(image: ImagesPath.facebookLogo),
        SizedBox(width: 20.w),
        TroundedImageContainer(image: ImagesPath.appleLogo),
      ],
    );
  }
}
