import '../../domain/entities/tvs.dart';

class TvModel extends Tv {
  const TvModel({
    required super.id,
    required super.name,
    super.backdropPath,
    required super.genreIds,
    required super.voteAverage,
    required super.overview,
  });
  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        id: json['id'],
        name: json['name'],
        backdropPath: json['backdrop_path'] ?? '',
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        voteAverage: json['vote_average'].toDouble(),
        overview: json['overview'],
      );
}
