// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumDTO _$AlbumDTOFromJson(Map<String, dynamic> json) => AlbumDTO(
      id: json['id'] as int,
      title: json['title'] as String,
      cover: json['cover'] as String,
      coverSmall: json['coverSmall'] as String,
      coverMedium: json['coverMedium'] as String,
      coverBig: json['coverBig'] as String,
      coverXl: json['coverXl'] as String,
      md5Image: json['md5Image'] as String,
      tracklist: json['tracklist'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$AlbumDTOToJson(AlbumDTO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
      'coverSmall': instance.coverSmall,
      'coverMedium': instance.coverMedium,
      'coverBig': instance.coverBig,
      'coverXl': instance.coverXl,
      'md5Image': instance.md5Image,
      'tracklist': instance.tracklist,
      'type': instance.type,
    };
