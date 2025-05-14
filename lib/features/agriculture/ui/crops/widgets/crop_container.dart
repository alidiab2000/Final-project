import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CropContainer extends StatelessWidget {
  const CropContainer({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 60.w,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xffC7E0AF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(
            icon,
            color: Colors.green[800],
            size: 24,
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: Colors.green[900],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
