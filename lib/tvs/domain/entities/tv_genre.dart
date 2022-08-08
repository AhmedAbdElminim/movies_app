import 'package:equatable/equatable.dart';

class TvGenre extends Equatable{
  final int id;
  final String name;

  const TvGenre({required this.id, required this.name});

  @override

  List<Object?> get props =>[id,name];
}