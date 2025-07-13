import 'package:dio/dio.dart';
import '../models/crops_recommendations_request/crops_recommendations_request.dart';
import '../models/crops_recommendations_response/crops_recommendations_response.dart';
import 'package:flutter/material.dart';

class RecommendationServices {
  final Dio dio;

  RecommendationServices(this.dio);
  Future<CropsRecommendationsResponse> getRecommendations({
    required CropsRecommendationsRequest request,
  }) async {
    try {
      debugPrint('Sending request: ${request.toJson()}');
      final response = await dio.post(
        'http://192.168.81.62:8000/api/recommendation',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return CropsRecommendationsResponse.fromJson(
          response.data as Map<String, dynamic>,
        );
      } else {
        throw Exception('Failed to load recommendations');
      }
    } catch (e) {
      throw Exception('Error fetching recommendations: $e');
    }
  }
}
