
import '../../domain/entities/tv_recommendation.dart';

class TvRecommendationModel extends TvRecommendation {
  const TvRecommendationModel({super.backdropPath, required super.id});
  factory TvRecommendationModel.fromJson(Map<String, dynamic> json) =>
      TvRecommendationModel(
          backdropPath:
          json['backdrop_path'] ?? '',///n2nm4aZRmXyJ9LT4xQX9X6ThcP7.jpg
          id: json['id']);
}
