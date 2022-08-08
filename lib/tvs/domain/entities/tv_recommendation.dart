import 'package:equatable/equatable.dart';

class TvRecommendation extends Equatable {
  final String? backdropPath;
  final int id;

  const TvRecommendation({this.backdropPath, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id, backdropPath];
}
