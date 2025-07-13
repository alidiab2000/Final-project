import '../../../../core/helper/extensions.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/widgets/popups/snakbars.dart';
import '../../data/models/weather_api_model.dart';
import '../../logic/recommendation_cubit/recommendations_cubit.dart';
import 'field_input_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/router/router.dart';
import '../../../../core/themes/styles.dart';
import 'crop_selected_field.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RecommendationsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Water Recommendation',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
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
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20,
              ),
              child: BlocConsumer<RecommendationsCubit, RecommendationsState>(
                listener: (context, state) {
                  if (state is RecommendationsLoaded) {
                    // Show a success message or navigate to another screen
                    CustomSnakbars.successSnackBar(
                      context,
                      title: "Success",
                      message: "Sent successfully",
                    );
                    context.pushNamed(
                      Routes.resultView,
                      arguments: state.recommendations,
                    );
                  } else if (state is RecommendationsError) {
                    CustomSnakbars.errorSnackBar(
                      context,
                      title: "Error",
                      message: state.message,
                    );
                    debugPrint("Error: ${state.message}");
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            Text(
                              "Enter the following details:",
                              textAlign: TextAlign.start,
                              style: TextStyles.font20BlackBold.copyWith(
                                color: ColorsManager.gray,
                              ),
                            ),
                            const SizedBox(height: 10),
                            CropSelectedField(cubit: cubit),
                            FieldInputSection(
                              label: "Area of land",
                              hint: "Sqr M",
                              controller: cubit.areaController,
                            ),
                            FieldInputSection(
                              label: "PH",

                              controller: cubit.phController,
                            ),

                            FieldInputSection(
                              label: "Naitrogen",
                              check: true,
                              controller: cubit.nController,
                            ),
                            FieldInputSection(
                              label: "Phosphorus",
                              check: true,
                              controller: cubit.pController,
                            ),
                            FieldInputSection(
                              label: "Potassium",
                              check: true,
                              controller: cubit.kController,
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
                            await cubit.calculateRecommendation(weatherModel);
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
