import 'package:equatable/equatable.dart';

class Video extends Equatable {
  final String videoKey;
  const Video({required this.videoKey});

  @override
  // TODO: implement props
  List<Object?> get props => [videoKey];
}
