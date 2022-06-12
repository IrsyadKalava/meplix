// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(
    id: json['id'] as int,
    title: json['title'] as String,
    overview: json['overview'] as String,
    poster: json['poster_path'] as String,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    popularity: (json['popularity'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.poster,
      'vote_average': instance.voteAverage,
      'popularity': instance.popularity,
    };
