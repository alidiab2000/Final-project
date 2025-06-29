import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:final_project/features/agriculture/data/models/crops_recommendations_response/crops_recommendations_response.dart';
import 'package:final_project/features/agriculture/data/models/crops_recommendations_response/recommendation.dart';
import 'package:final_project/features/agriculture/data/models/weather_api_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final RecommendationServices recommendationServices;
  final formKey = GlobalKey<FormState>();
  String? selectedCrop;
  bool? rainfall;
  bool isLoading = false;
  Future<void> calculateRecommendation(WeatherModel weatherData) async {
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
                    temperature: weatherData.currentTemp?.toDouble() ?? 0.0,
                    rainfallMm: weatherData.rainFall == 1 ? true : false,
                    humidity: weatherData.humidity ?? 0,
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

  Future<void> saveToFirebase(CropsRecommendationsResponse result) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        emit(RecommendationsError("User not logged in"));
        return;
      }

      final recommendations = result.recommendations;

      // Save each recommendation in the list

      final db = FirebaseFirestore.instance;
      for (final rec in recommendations) {
        DocumentReference docRef = db
            .collection("Recommendations")
            .doc(user.uid);

        // 1. هات البيانات القديمة
        DocumentSnapshot snapshot = await docRef.get();
        var data = snapshot.data() as Map<String, dynamic>?;
        // 2. هات الـ List الحالية أو خالي لو مفيش
        List currentRecommendations = data?['recommendations'] ?? [];
        // 3. ضيف الـ Map الجديد
        currentRecommendations.add(rec.toJson());

        // 2. Convert rec to map
        Map<String, dynamic> newRec = rec.toJson();

        // 3. Check if it's already added
        bool alreadyExists = currentRecommendations.any((element) {
          return MapEquality().equals(
            Map<String, dynamic>.from(element),
            newRec,
          );
        });

        // 4. If not, add it
        if (!alreadyExists) {
          currentRecommendations.add(newRec);
          await docRef.update({'recommendations': currentRecommendations});
        }
      }

      emit(RecommendationsSaved());
    } catch (e) {
      emit(RecommendationsError("Failed to save: $e"));
    }
  }

  Future<List<Recommendation>> fetchRecommendationsFromFirebase({
    List<DateTime>? selectedDates,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        emit(RecommendationsError("User not logged in"));
        return [];
      }

      final db = FirebaseFirestore.instance;
      DocumentReference docRef = db.collection("Recommendations").doc(user.uid);

      DocumentSnapshot snapshot = await docRef.get();
      var data = snapshot.data() as Map<String, dynamic>?;

      if (data == null || data['recommendations'] == null) {
        return [];
      }

      List<dynamic> recommendations = data['recommendations'];
      List<Recommendation> allRecommendations =
          recommendations
              .map<Recommendation>(
                (item) =>
                    Recommendation.fromJson(Map<String, dynamic>.from(item)),
              )
              .toList();

      // If no selected dates provided, return all recommendations
      if (selectedDates == null || selectedDates.isEmpty) {
        return allRecommendations;
      }

      // Filter recommendations based on selected dates
      List<Recommendation> filteredRecommendations = [];

      for (Recommendation recommendation in allRecommendations) {
        try {
          DateTime recommendationDate = DateTime.parse(recommendation.date);

          // Check if the recommendation date matches any selected date
          bool isDateSelected = selectedDates.any((selectedDate) {
            return recommendationDate.year == selectedDate.year &&
                recommendationDate.month == selectedDate.month &&
                recommendationDate.day == selectedDate.day;
          });

          if (isDateSelected) {
            filteredRecommendations.add(recommendation);
          }
        } catch (e) {
          // Skip recommendations with invalid date format
          continue;
        }
      }

      return filteredRecommendations;
    } catch (e) {
      emit(RecommendationsError("Failed to fetch: $e"));
      return [];
    }
  }
}
