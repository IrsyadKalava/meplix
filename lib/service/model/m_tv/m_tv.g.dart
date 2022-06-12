// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_tv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mtv _$MtvFromJson(Map<String, dynamic> json) {
  return Mtv(
    result: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : ResultTV.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MtvToJson(Mtv instance) => <String, dynamic>{
      'results': instance.result,
    };
