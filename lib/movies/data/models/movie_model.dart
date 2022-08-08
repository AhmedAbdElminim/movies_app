import 'package:movies_app/movies/domain/entities/movies.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genreIds,
      required super.voteAverage,
      required super.overview,
      required super.releaseDate});
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      voteAverage: json['vote_average'].toDouble(),
      overview: json['overview'],
      releaseDate: json['release_date']);
}
