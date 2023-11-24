// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackDTO _$TrackDTOFromJson(Map<String, dynamic> json) => TrackDTO(
      id: json['id'] as int,
      readable: json['readable'] as bool,
      title: json['title'] as String,
      titleShort: json['title_short'] as String,
      titleVersion: json['title_version'] as String,
      link: json['link'] as String,
      duration: json['duration'] as int,
      rank: json['rank'] as int,
      explicitLyrics: json['explicit_lyrics'] as bool,
      explicitContentLyrics: json['explicit_content_lyrics'] as int,
      explicitContentCover: json['explicit_content_cover'] as int,
      preview: json['preview'] as String,
      md5Image: json['md5_image'] as String,
      artist: ArtistDTO.fromJson(json['artist'] as Map<String, dynamic>),
      album: AlbumDTO.fromJson(json['album'] as Map<String, dynamic>),
      type: json['type'] as String,
    );

Map<String, dynamic> _$TrackDTOToJson(TrackDTO instance) => <String, dynamic>{
      'id': instance.id,
      'readable': instance.readable,
      'title': instance.title,
      'title_short': instance.titleShort,
      'title_version': instance.titleVersion,
      'link': instance.link,
      'duration': instance.duration,
      'rank': instance.rank,
      'explicit_lyrics': instance.explicitLyrics,
      'explicit_content_lyrics': instance.explicitContentLyrics,
      'explicit_content_cover': instance.explicitContentCover,
      'preview': instance.preview,
      'md5_image': instance.md5Image,
      'artist': instance.artist,
      'album': instance.album,
      'type': instance.type,
    };
