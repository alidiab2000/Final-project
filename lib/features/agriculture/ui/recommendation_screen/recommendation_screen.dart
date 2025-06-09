import 'package:final_project/core/widgets/popups/snakbars.dart';
import 'package:final_project/features/agriculture/logic/recommendation_cubit/recommendations_cubit.dart';
import 'package:final_project/features/agriculture/ui/recommendation_screen/field_input_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RecommendationsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendation'),
        backgroundColor: const Color(0xff1E640A),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: cubit.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocConsumer<RecommendationsCubit, RecommendationsState>(
                listener: (context, state) {
                  if (state is RecommendationsLoaded) {
                    // Show a success message or navigate to another screen
                    CustomSnakbars.successSnackBar(
                      context,
                      title: "Success",
                      message: "Sent successfully",
                    );
                  } else if (state is RecommendationsError) {
                    debugPrint("Error: ${state.message}");
                    CustomSnakbars.errorSnackBar(
                      context,
                      title: "Error",
                      message: "Failed",
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FieldInputSection(
                              label: "PH",
                              controller: cubit.phController,
                            ),
                            FieldInputSection(
                              label: "Humidity",
                              controller: cubit.humidityController,
                            ),
                            FieldInputSection(
                              label: "Temperature",
                              controller: cubit.tempController,
                            ),
                            FieldInputSection(
                              label: "Naitrogen",
                              controller: cubit.nController,
                            ),
                            FieldInputSection(
                              label: "Phosphorus",
                              controller: cubit.pController,
                            ),
                            FieldInputSection(
                              label: "Potassium",
                              controller: cubit.kController,
                            ),
                            FieldInputSection(
                              label: "Rainfall",
                              controller: cubit.rainfallController,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff1E640A),
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () async {
                            await cubit.calculateRecommendation();
                          },
                          child:
                              cubit.isLoading
                                  ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                  : const Text(
                                    'Send',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
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
        ),
      ),
    );
  }
}
