// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_popular.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MPopular _$MPopularFromJson(Map<String, dynamic> json) {
  return MPopular(
    result: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Results.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MPopularToJson(MPopular instance) => <String, dynamic>{
      'results': instance.result,
    };
