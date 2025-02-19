import 'package:final_project/core/helper/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/commen/trounded_imagecontainer.dart';

class ScoialMediaIcons extends StatelessWidget {
  const ScoialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedImageContainer(image:ImagesPath.googleLogo),
        SizedBox(width: 20.w),
        RoundedImageContainer(image: ImagesPath.facebookLogo),
        SizedBox(width: 20.w),
        RoundedImageContainer(image: ImagesPath.appleLogo),
      ],
    );
  }
}
