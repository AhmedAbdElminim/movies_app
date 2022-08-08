import 'package:movies_app/trending/domain/entities/trending.dart';

class TrendingModel extends Trending {
  const TrendingModel(
      {required super.backdropPath,
      required super.overview,
      required super.title,
      required super.mediaType,
      required super.id,
      required super.voteAverage,
      required super.releaseDate});
  factory TrendingModel.fromJson(Map<String, dynamic> json) => TrendingModel(
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        title: json['title'] ?? 'No Title Available',
        mediaType: json['media_type'],
        id: json['id'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date'] ?? 'hello',
      );
}
