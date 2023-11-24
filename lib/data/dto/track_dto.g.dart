// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackDTO _$TrackDTOFromJson(Map<String, dynamic> json) => TrackDTO(
      id: json['id'] as int,
      readable: json['readable'] as bool,
      title: json['title'] as String,
      titleShort: json['titleShort'] as String,
      titleVersion: json['titleVersion'] as String,
      link: json['link'] as String,
      duration: json['duration'] as int,
      rank: json['rank'] as int,
      explicitLyrics: json['explicitLyrics'] as bool,
      explicitContentLyrics: json['explicitContentLyrics'] as int,
      explicitContentCover: json['explicitContentCover'] as int,
      preview: json['preview'] as String,
      md5Image: json['md5Image'] as String,
      artist: ArtistDTO.fromJson(json['artist'] as Map<String, dynamic>),
      album: AlbumDTO.fromJson(json['album'] as Map<String, dynamic>),
      type: json['type'] as String,
    );

Map<String, dynamic> _$TrackDTOToJson(TrackDTO instance) => <String, dynamic>{
      'id': instance.id,
      'readable': instance.readable,
      'title': instance.title,
      'titleShort': instance.titleShort,
      'titleVersion': instance.titleVersion,
      'link': instance.link,
      'duration': instance.duration,
      'rank': instance.rank,
      'explicitLyrics': instance.explicitLyrics,
      'explicitContentLyrics': instance.explicitContentLyrics,
      'explicitContentCover': instance.explicitContentCover,
      'preview': instance.preview,
      'md5Image': instance.md5Image,
      'artist': instance.artist,
      'album': instance.album,
      'type': instance.type,
    };
