import 'package:json_annotation/json_annotation.dart';

part 'result_tv.g.dart';

@JsonSerializable()
class ResultTV {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "overview")
  String overview;
  @JsonKey(name: "backdrop_path")
  String poster;
  @JsonKey(name: "vote_average")
  double voteAverage;
  @JsonKey(name: "popularity")
  double popularity;

  ResultTV({this.id, this.name, this.overview, this.poster, this.voteAverage, this.popularity});

  factory ResultTV.fromJson(Map<String, dynamic> json) =>
      _$ResultTVFromJson(json);

  Map<String, dynamic> toJson() => _$ResultTVToJson(this);
}
