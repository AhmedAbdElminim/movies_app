import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final int id;
 final String name;
  final String? backdropPath;
  final List<int> genreIds;
  final double voteAverage;
  final String overview;


  const Tv(
      {required this.id,
        required this.name,

       this.backdropPath,
      required this.genreIds,
      required this.voteAverage,
      required this.overview,
      });

  @override
  List<Object?> get props =>
      [id, backdropPath, genreIds, voteAverage, overview];
}
