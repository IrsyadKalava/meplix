import 'package:json_annotation/json_annotation.dart';
import 'package:meplix/service/model/result/results.dart';

part 'm_top_rated.g.dart';

@JsonSerializable()
class MTopRated {
  @JsonKey(name: "results")
  List<Results> result;

  MTopRated({this.result});

  factory MTopRated.fromJson(Map<String, dynamic> json) =>
      _$MTopRatedFromJson(json);

  Map<String, dynamic> toJson() => _$MTopRatedToJson(this);
}
