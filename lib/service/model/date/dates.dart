import 'package:json_annotation/json_annotation.dart';

part 'dates.g.dart';

@JsonSerializable()
class DatesMovie {
  @JsonKey(name: "maximum")
  String max;
  @JsonKey(name: "minimum")
  String min;

  DatesMovie({this.max, this.min});

  factory DatesMovie.fromJson(Map<String, dynamic> json) =>
      _$DatesMovieFromJson(json);

  Map<String, dynamic> toJson() => _$DatesMovieToJson(this);
}
