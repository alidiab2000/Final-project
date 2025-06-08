import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/images.dart';
import '../../../../../core/themes/styles.dart';

class ComingWeatherGridView extends StatelessWidget {
  const ComingWeatherGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 4,
      itemBuilder:
          (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: Container(
              padding: EdgeInsets.all(12),
              height: 80.h,

              decoration: BoxDecoration(
                //border: Border.all(color: Colors.grey, width: 0.5),
                color: Color(0xffF4FFF1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Image.asset(ImagesPath.air, width: 40.w),
                  SizedBox(width: 5.w),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Air Quality",
                          style: TextStyles.font20BlackBold.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                        Text("12 Km/h", style: TextStyles.font14BlackRegular),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
