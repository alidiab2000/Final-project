import 'package:final_project/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Good Morning $userName", style: TextStyles.font20BlackBold),
              Text("Welcome back ", style: TextStyles.font14GrayRegular),
            ],
          ),
          IconButton(
            onPressed: () {},
            iconSize: 30.h,
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
    );
  }
}
