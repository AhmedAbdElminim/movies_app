
import '../../domain/entities/tv_genre.dart';

class TvGenresModel extends TvGenre {
  const TvGenresModel({required super.id, required super.name});
  factory TvGenresModel.fromJson(Map<String, dynamic> json) =>
      TvGenresModel(id: json['id'], name: json['name']);
}
