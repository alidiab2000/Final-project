import 'package:final_project/core/helper/extensions.dart';
import 'package:final_project/core/helper/images.dart';
import 'package:final_project/core/router/router.dart';
import 'package:final_project/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CropsScreen extends StatelessWidget {
  CropsScreen({super.key});

  final List<String> cropsImage = [
    ImagesPath.riceImage,
    ImagesPath.wheatImage,
    ImagesPath.cropsImage,
  ];
  final List<String> cropsNames = ["Rice", "Wheat", "More crops"];
  final List<Map<String, dynamic>> cropsInfo = [
    {
      "name": "Rice",
      "image": ImagesPath.riceVector,

      "description":
          "Rice is a water-intensive crop that grows best in flooded fields .t requires regular irrigation, especially during the early growth and flowering stages.Proper water management increases yield and prevents diseases like root rot.",
      "waterAmount": "25-30%",
      "temperature": "25-32°C",
      "soilType": "clay soil",
    },
    {
      "name": "Wheat",
      "image": ImagesPath.wheatVector,

      "description":
          "Wheat is one of Egypt's most important staple crops.The country produces millions of tons annually, mainly in the Nile Delta.Egypt also imports large quantities to meet growing demand.",

      "waterAmount": "25-30%",
      "temperature": "20-25°C",
      "soilType": " clay soil",
    },
    {
      "name": "Wheat",
      "image": ImagesPath.wheatVector,

      "description":
          "Wheat is one of Egypt's most important staple crops.The country produces millions of tons annually, mainly in the Nile Delta.Egypt also imports large quantities to meet growing demand.",

      "waterAmount": "25-30%",
      "temperature": "20-25°C",
      "soilType": "Fertile, well-drained clay soil",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
        title: Center(
          child: Text(
            "Crops",
            style: TextStyles.font12BlackBold.copyWith(fontSize: 16.sp),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            itemCount: cropsImage.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عدد الأعمدة
              crossAxisSpacing: 0,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  InkWell(
                    onTap: () {
                      context.pushNamed(
                        Routes.cropInfo,
                        arguments: cropsInfo[index],
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60), // شكل دائري
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.4,
                        color: Colors.brown.shade100,
                        child: Image.asset(
                          cropsImage[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        cropsNames[index],
                        style: TextStyles.font20WhiteBold.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
