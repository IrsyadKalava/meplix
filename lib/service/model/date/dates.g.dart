// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatesMovie _$DatesMovieFromJson(Map<String, dynamic> json) {
  return DatesMovie(
    max: json['maximum'] as String,
    min: json['minimum'] as String,
  );
}

Map<String, dynamic> _$DatesMovieToJson(DatesMovie instance) =>
    <String, dynamic>{
      'maximum': instance.max,
      'minimum': instance.min,
    };
