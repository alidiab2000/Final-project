import 'package:final_project/core/helper/images.dart';
import 'package:final_project/core/themes/colors.dart';
import 'package:final_project/features/agriculture/ui/crops/widgets/crop_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .4,
                  child: Image.asset(ImagesPath.curveImage, fit: BoxFit.fill),
                ),
                Positioned(
                  bottom: -50,
                  left: 80.sp,
                  child: SizedBox(
                    width: 200.sp,
                    height: 200.sp,
                    child: Image.asset(cropInfo["image"]),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 40,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(
                        0.6,
                      ), // دائرة بلون أبيض شفاف
                    ),
                    padding: EdgeInsets.all(12),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black87,
                        size: 24,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "crop info :",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    cropInfo["name"],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    cropInfo["description"],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CropContainer(
                        icon: Icons.water_drop,
                        title: cropInfo["waterAmount"],
                      ),
                      CropContainer(
                        icon: Icons.sunny,
                        title: cropInfo["temperature"],
                      ),
                      CropContainer(
                        icon: Icons.water,
                        title: cropInfo["soilType"],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
