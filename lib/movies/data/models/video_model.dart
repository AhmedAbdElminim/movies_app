import 'package:movies_app/movies/domain/entities/video.dart';

class VideoModel extends Video {
  const VideoModel({required super.videoKey});
  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      VideoModel(videoKey: json['key']);
}
