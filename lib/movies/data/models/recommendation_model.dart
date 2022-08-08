import 'package:movies_app/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({super.backdropPath, required super.id});
  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
          backdropPath:
              json['backdrop_path'] ?? '',///n2nm4aZRmXyJ9LT4xQX9X6ThcP7.jpg
                id: json['id']);
}
