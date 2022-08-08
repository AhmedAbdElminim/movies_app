import '../../domain/entities/tv_video.dart';

class TvVideoModel extends TvVideo{
  const TvVideoModel({required super.tvVideoKey});
  factory TvVideoModel.fromJson(Map<String,dynamic>json)=>TvVideoModel(tvVideoKey: json['key']);
}