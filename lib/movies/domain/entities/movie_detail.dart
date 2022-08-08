import 'package:equatable/equatable.dart';

import 'genre.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final String overview;
  final int id;
  final List<Genre> genre;

  final int runTime;
  final String releaseDate;
  final String title;
  final double voteAverage;
  const MovieDetail(
      {required this.backdropPath,
      required this.overview,
      required this.id,
      required this.runTime,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,
      required this.genre});

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        overview,
        id,
        runTime,
        releaseDate,
        title,
        voteAverage,
        genre
      ];
}
