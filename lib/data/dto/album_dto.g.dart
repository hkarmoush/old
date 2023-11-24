// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumDTO _$AlbumDTOFromJson(Map<String, dynamic> json) => AlbumDTO(
      id: json['id'] as int,
      title: json['title'] as String,
      cover: json['cover'] as String,
      coverSmall: json['cover_small'] as String,
      coverMedium: json['cover_medium'] as String,
      coverBig: json['cover_big'] as String,
      coverXl: json['cover_xl'] as String,
      md5Image: json['md5_image'] as String,
      tracklist: json['tracklist'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$AlbumDTOToJson(AlbumDTO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
      'cover_small': instance.coverSmall,
      'cover_medium': instance.coverMedium,
      'cover_big': instance.coverBig,
      'cover_xl': instance.coverXl,
      'md5_image': instance.md5Image,
      'tracklist': instance.tracklist,
      'type': instance.type,
    };
