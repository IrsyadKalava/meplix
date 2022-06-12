// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_tv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultTV _$ResultTVFromJson(Map<String, dynamic> json) {
  return ResultTV(
    id: json['id'] as int,
    name: json['name'] as String,
    overview: json['overview'] as String,
    poster: json['backdrop_path'] as String,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    popularity: (json['popularity'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ResultTVToJson(ResultTV instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'backdrop_path': instance.poster,
      'vote_average': instance.voteAverage,
      'popularity': instance.popularity,
    };
