import 'package:equatable/equatable.dart';

class Trending extends Equatable {
  final String backdropPath;
  final String overview;
  final String title;
  final String mediaType;
  final int id;
  final double voteAverage;
  final String releaseDate;

  const Trending(
      {required this.backdropPath,
      required this.overview,
      required this.title,
      required this.mediaType,
      required this.id,
      required this.voteAverage,
      required this.releaseDate});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [backdropPath, overview, title, mediaType, id, voteAverage, releaseDate];
}
