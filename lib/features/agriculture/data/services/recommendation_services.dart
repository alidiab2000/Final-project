import 'package:dio/dio.dart';
import 'package:final_project/features/agriculture/data/models/crops_recommendations_request/crops_recommendations_request.dart';
import 'package:final_project/features/agriculture/data/models/crops_recommendations_response/crops_recommendations_response.dart';


class RecommendationServices {
  final Dio dio;

  RecommendationServices(this.dio);
  Future<CropsRecommendationsResponse> getRecommendations({
    required CropsRecommendationsRequest request,
    
  }) async {
    try {
      final response = await dio.post(
        'http://192.168.1.6:8000/api/recommendation',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        // debugPrint('Response data: ${response.data}');

        return CropsRecommendationsResponse.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load recommendations');
      }
    } catch (e) {
      throw Exception('Error fetching recommendations: $e');
    }
  }
}
