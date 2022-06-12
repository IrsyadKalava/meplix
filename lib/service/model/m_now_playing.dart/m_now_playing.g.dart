// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_now_playing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MNowPlaying _$MNowPlayingFromJson(Map<String, dynamic> json) {
  return MNowPlaying(
    result: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Results.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MNowPlayingToJson(MNowPlaying instance) =>
    <String, dynamic>{
      'results': instance.result,
    };
