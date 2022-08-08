import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel(
      {required super.backdropPath,
      required super.overview,
      required super.id,
      required super.runTime,
      required super.releaseDate,
      required super.title,
      required super.voteAverage,
      required super.genre});
  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        id: json['id'],
        runTime: json['runtime'],
        releaseDate: json['release_date'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
        genre: List<GenresModel>.from(
            json['genres'].map((x) => GenresModel.fromJson(x))),
      );
}
