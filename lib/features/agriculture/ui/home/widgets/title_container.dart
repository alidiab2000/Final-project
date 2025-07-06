import 'package:final_project/core/helper/images.dart';
import 'package:final_project/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagesPath.homeBackgroud),
          fit: BoxFit.cover, // تغطية كاملة للصورة
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 50.h,
            left: 15.w,
            child: Text(
              "Good Morning",
              style: TextStyles.font20WhiteBold.copyWith(color: Colors.black),
            ),
          ),
          Positioned(
            top: 80.h,
            left: 15.w,
            child: Text(
              "Hi, $userName",
              style: TextStyles.font20WhiteBold.copyWith(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
