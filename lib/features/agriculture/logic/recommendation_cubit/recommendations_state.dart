part of 'recommendations_cubit.dart';


sealed class RecommendationsState {}

final class RecommendationsInitial extends RecommendationsState {}
final class RecommendationsLoading extends RecommendationsState {}
final class RecommendationsLoaded extends RecommendationsState {
  final CropsRecommendationsResponse recommendations;

  RecommendationsLoaded(this.recommendations);
}
final class RecommendationsError extends RecommendationsState {
  final String message;

  RecommendationsError(this.message);
}