import 'package:json_annotation/json_annotation.dart';
import 'package:meplix/service/model/result/results.dart';

part 'm_popular.g.dart';

@JsonSerializable()
class MPopular {
  @JsonKey(name: "results")
  List<Results> result;

  MPopular({this.result});

  factory MPopular.fromJson(Map<String, dynamic> json) =>
      _$MPopularFromJson(json);

  Map<String, dynamic> toJson() => _$MPopularToJson(this);
}
