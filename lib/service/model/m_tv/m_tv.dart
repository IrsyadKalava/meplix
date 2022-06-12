import 'package:json_annotation/json_annotation.dart';
import 'package:meplix/service/model/result/result_tv.dart';
import 'package:meplix/service/model/result/results.dart';

part 'm_tv.g.dart';

@JsonSerializable()
class Mtv {
  @JsonKey(name: "results")
  List<ResultTV> result;

  Mtv({this.result});

  factory Mtv.fromJson(Map<String, dynamic> json) => _$MtvFromJson(json);

  Map<String, dynamic> toJson() => _$MtvToJson(this);
}
