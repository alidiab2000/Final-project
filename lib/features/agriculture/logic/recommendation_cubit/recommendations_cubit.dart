// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:final_project/features/agriculture/data/models/crops_recommendations_response/crops_recommendations_response.dart';
import 'package:flutter/widgets.dart';
import 'package:final_project/features/agriculture/data/services/recommendation_services.dart';
import '../../data/models/crops_recommendations_request/crops_recommendations_request.dart';
import '../../data/models/crops_recommendations_request/weekly_weather_datum.dart';
part 'recommendations_state.dart';

class RecommendationsCubit extends Cubit<RecommendationsState> {
  RecommendationsCubit(this.recommendationServices)
    : super(RecommendationsInitial());
  final TextEditingController phController = TextEditingController();
  final TextEditingController nController = TextEditingController();
  final TextEditingController pController = TextEditingController();
  final TextEditingController kController = TextEditingController();
  final TextEditingController tempController = TextEditingController();
  final TextEditingController rainfallController = TextEditingController();
  final TextEditingController humidityController = TextEditingController();

  final RecommendationServices recommendationServices;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  void disposeControllers() {
    phController.dispose();
    nController.dispose();
    pController.dispose();
    kController.dispose();
    tempController.dispose();
    rainfallController.dispose();
    humidityController.dispose();
  }

  Future<void> calculateRecommendation() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      emit(RecommendationsLoading());
      try {
        CropsRecommendationsResponse recommendations  =
            await recommendationServices.getRecommendations(
              request: CropsRecommendationsRequest(
                area: 1000,
                crop: "rice",
                weeklyWeatherData: [
                  WeeklyWeatherDatum(
                    ph: double.parse(phController.text),
                    n: double.parse(nController.text),
                    p: double.parse(pController.text),
                    k: double.parse(kController.text),
                    temperature: double.parse(tempController.text),
                    rainfallMm:
                        int.parse(rainfallController.text) == 1 ? true : false,
                    humidity: int.parse(humidityController.text),
                  ),
                ],
              ),
            );
        emit(RecommendationsLoaded(recommendations));
        isLoading = false;
      } catch (e) {
        emit(RecommendationsError(e.toString()));
      } finally {
        isLoading = false;
        //disposeControllers();
      }
    } else {
      emit(RecommendationsError("Please fill all fields correctly"));
      isLoading = false;
    }
  }
}
