import 'package:movies_app/tvs/data/models/tv_genre_model.dart';

import '../../domain/entities/tv_details.dart';

class TvDetailModel extends TvDetail {
  const TvDetailModel(
      {required super.backdropPath,
      required super.id,
      required super.firstAirDate,
      required super.name,
      required super.voteAverage,
      required super.genre});
  factory TvDetailModel.fromJson(Map<String, dynamic> json) => TvDetailModel(
        backdropPath: json['backdrop_path'],
        id: json['id'],
        firstAirDate: json['first_air_date'],
        name: json['name'],
        voteAverage: json['vote_average'].toDouble(),
        genre: List<TvGenresModel>.from(
            json['genres'].map((x) => TvGenresModel.fromJson(x))),
      );
}
