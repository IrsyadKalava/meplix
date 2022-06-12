import 'package:json_annotation/json_annotation.dart';
import 'package:meplix/service/model/result/results.dart';

part 'm_now_playing.g.dart';

@JsonSerializable()
class MNowPlaying {
  @JsonKey(name: "results")
  List<Results> result;

  MNowPlaying({this.result});

  factory MNowPlaying.fromJson(Map<String, dynamic> json) =>
      _$MNowPlayingFromJson(json);

  Map<String, dynamic> toJson() => _$MNowPlayingToJson(this);
}
