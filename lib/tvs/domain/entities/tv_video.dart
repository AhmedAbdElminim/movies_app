import 'package:equatable/equatable.dart';

class TvVideo extends Equatable{
  final String tvVideoKey;

  const TvVideo({required this.tvVideoKey});

  @override
  // TODO: implement props
  List<Object?> get props => [tvVideoKey];

}