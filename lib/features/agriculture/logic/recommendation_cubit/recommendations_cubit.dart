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
  final TextEditingController humidityController = TextEditingController();
  final RecommendationServices recommendationServices;
  final formKey = GlobalKey<FormState>();
  String? selectedCrop;
  bool? rainfall;
  bool isLoading = false;
  void disposeControllers() {
    phController.dispose();
    nController.dispose();
    pController.dispose();
    kController.dispose();
    tempController.dispose();

    humidityController.dispose();
  }

  Future<void> calculateRecommendation() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      emit(RecommendationsLoading());
      try {
        CropsRecommendationsResponse recommendations =
            await recommendationServices.getRecommendations(
              request: CropsRecommendationsRequest(
                area: 1000,
                crop: selectedCrop ?? "Rice",
                weeklyWeatherData: [
                  WeeklyWeatherDatum(
                    date: DateTime.now().toString().substring(0, 10),
                    ph: double.parse(phController.text),
                    n: double.parse(nController.text),
                    p: double.parse(pController.text),
                    k: double.parse(kController.text),
                    temperature: double.parse(tempController.text),
                    rainfallMm: rainfall ?? false,
                    humidity: int.parse(humidityController.text),
                  ),
                ],
              ),
            );
        emit(RecommendationsLoaded(recommendations));
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
