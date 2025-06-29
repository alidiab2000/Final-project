import 'package:final_project/core/helper/extensions.dart';
import 'package:final_project/core/helper/images.dart';
import 'package:final_project/core/router/router.dart';
import 'package:final_project/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CropsScreen extends StatelessWidget {
  CropsScreen({super.key});

  final List<Map<String, dynamic>> cropsInfo = [
    {
      "name": "Rice",
      "image_panal": ImagesPath.riceImage,
      "image": ImagesPath.riceVector,

      "description":
          "Rice is a water-intensive crop that grows best in flooded fields .t requires regular irrigation, especially during the early growth and flowering stages.Proper water management increases yield and prevents diseases like root rot.",
      "waterAmount": "25-30%",
      "temperature": "25-32°C",
      "soilType": "clay soil",
    },
    {
      "name": "Cotton",
      "image_panal": ImagesPath.cottonImage,
      "image": ImagesPath.cottonVector,

      "description":
          "Cotton is one of Egypt's major cash crops. The country produces a significant amount of cotton annually, mainly in the Nile Delta and other parts of the country.",

      "waterAmount": "60-80%",
      "temperature": "18-22°C",
      "soilType": "well-drained soil",
    },
    {
      "name": "Banana",
      "image_panal": ImagesPath.bananaImage,
      "image": ImagesPath.bananaVector,

      "description":
          "Banana trees prefer direct sunlight for at least 6 hours per day The soil should be fertile and well-drained Bananas can be grown most of the year, but planting is best in spring or fall Bananas require regular watering, especially during dry periods",

      "waterAmount": "4-6 Mm ",
      "temperature": "25° - 35°C",
      "soilType": "Loamy soil",
    },
    {
      "name": "Maize",
      "image_panal": ImagesPath.maizeImage,
      "image": ImagesPath.maizeVector,

      "description":
          "Corn is planted in the summer season from the beginning of April until the end of June, and the beginning of May is preferred to obtain the best crop. Corn needs nitrogen and potassium fertilization throughout the growth period.",

      "waterAmount": "5-7 Mm ",
      "temperature": "21° - 30°C",
      "soilType": "Clay loam soil",
    },
    {
      "name": "Watermelon",
      "image_panal": ImagesPath.watermelonImage,
      "image": ImagesPath.watermelonVector,

      "description":
          "Watermelons grow best in 25–35°C with well-drained sandy loam soil (pH 6.0–6.5) Regular watering is key during flowering and fruiting. Use NPK fertilizer like 10-10-10 or 8-24-24 Plant 1.5–2 m apart Needs 6–8 hours of full sun daily.",

      "waterAmount": "3-5 Mm ",
      "temperature": "25° - 35°C",
      "soilType": "Sandy loam soil",
    },
    {
      "name": "More crops",
      "image_panal": ImagesPath.cropsImage,
      "image": ImagesPath.comingSoon,

      "description": "More Crops Coming Soon",

      "waterAmount": "Soon",
      "temperature": "Soon",
      "soilType": "Soon",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Crops")),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            itemCount: cropsInfo.length,
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
                          cropsInfo[index]['image_panal'],
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
                        color: Colors.black.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        cropsInfo[index]['name'],
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
