// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_top_rated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MTopRated _$MTopRatedFromJson(Map<String, dynamic> json) {
  return MTopRated(
    result: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Results.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MTopRatedToJson(MTopRated instance) => <String, dynamic>{
      'results': instance.result,
    };
