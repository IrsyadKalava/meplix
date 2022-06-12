import 'package:json_annotation/json_annotation.dart';

part 'results.g.dart';

@JsonSerializable()
class Results {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "overview")
  String overview;
  @JsonKey(name: "poster_path")
  String poster;
  @JsonKey(name: "vote_average")
  double voteAverage;
  @JsonKey(name: "popularity")
  double popularity;

  Results({this.id, this.title, this.overview, this.poster, this.voteAverage, this.popularity});

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
