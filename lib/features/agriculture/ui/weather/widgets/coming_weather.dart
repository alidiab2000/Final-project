import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/images.dart';
import '../../../../../core/themes/styles.dart';

class ComingWeather extends StatelessWidget {

  const ComingWeather({super.key, required this.avgTemp, required this.dayName});

  final String avgTemp;
  final String dayName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(dayName, style: TextStyles.font14GrayRegular),
       
        SizedBox(height: 10.h),
        Image.asset(ImagesPath.sun, width: 50.w),
        SizedBox(height: 10.h),
        Text(avgTemp, style: TextStyles.font14GrayRegular),
      ],
    );
  }
}
