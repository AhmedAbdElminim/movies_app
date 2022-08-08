import 'package:equatable/equatable.dart';
import 'package:movies_app/tvs/domain/entities/tv_genre.dart';

class TvDetail extends Equatable {
  final String backdropPath;

  final int id;
  final List<TvGenre> genre;

  final String firstAirDate;
  final String name;
  final double voteAverage;
  const TvDetail(
      {required this.backdropPath,
      required this.id,
      required this.firstAirDate,
      required this.name,
      required this.voteAverage,
      required this.genre});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [backdropPath, id, firstAirDate, name, voteAverage, genre];
}
