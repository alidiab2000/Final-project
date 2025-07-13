// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_project/core/helper/extensions.dart';
import 'package:final_project/core/router/router.dart';
import 'package:final_project/core/themes/colors.dart';
import 'package:final_project/core/widgets/popups/snakbars.dart';
import 'package:final_project/features/agriculture/logic/recommendation_cubit/recommendations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/crops_recommendations_response/crops_recommendations_response.dart';

class ResueltView extends StatelessWidget {
  const ResueltView({super.key, required this.result});
  final CropsRecommendationsResponse result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              //height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: [
                  RecommendationCard(
                    title: "Date",
                    data: result.recommendations[0].date,
                  ),
                  RecommendationCard(
                    title: "Crop",
                    data: result.recommendations[0].cropName,
                  ),
                  RecommendationCard(
                    title: "Area",
                    data: "${result.recommendations[0].area} Sqm",
                  ),
                  RecommendationCard(
                    title: "Water Usage Per Sqm",
                    data: result.recommendations[0].waterUsagePerSqm,
                  ),
                  RecommendationCard(
                    title: "Total Water Usage",
                    data: result.recommendations[0].totalWaterUsage,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: BlocListener<
                      RecommendationsCubit,
                      RecommendationsState
                    >(
                      listener: (context, state) {
                        // INSERT_YOUR_CODE
                        if (state is RecommendationsSaved) {
                          CustomSnakbars.successSnackBar(
                            context,
                            title: 'Recommendations saved successfully!',
                          );
                          context.pushReplacementNamed(
                            Routes.navigationBarMenu,
                          );
                        } else if (state is RecommendationsError) {
                          CustomSnakbars.errorSnackBar(
                            context,
                            title: state.message,
                          );
                        }
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<RecommendationsCubit>().saveToFirebase(
                            result,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1E640A),
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    super.key,
    required this.title,
    required this.data,
  });

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: ColorsManager.maingreen.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(data),
          ],
        ),
      ),
    );
  }
}
