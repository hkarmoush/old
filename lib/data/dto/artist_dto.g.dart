// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistDTO _$ArtistDTOFromJson(Map<String, dynamic> json) => ArtistDTO(
      id: json['id'] as int,
      name: json['name'] as String,
      link: json['link'] as String,
      picture: json['picture'] as String,
      pictureSmall: json['pictureSmall'] as String,
      pictureMedium: json['pictureMedium'] as String,
      pictureBig: json['pictureBig'] as String,
      pictureXl: json['pictureXl'] as String,
      tracklist: json['tracklist'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ArtistDTOToJson(ArtistDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'link': instance.link,
      'picture': instance.picture,
      'pictureSmall': instance.pictureSmall,
      'pictureMedium': instance.pictureMedium,
      'pictureBig': instance.pictureBig,
      'pictureXl': instance.pictureXl,
      'tracklist': instance.tracklist,
      'type': instance.type,
    };
