import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/styles.dart';

class TitleAndText extends StatelessWidget {
  const TitleAndText({super.key, required this.title, required this.text});
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.font24GreenBold),
        SizedBox(height: 10.w),
        Text(text, style: TextStyles.font14GrayRegular),
      ],
    );
  }
}
