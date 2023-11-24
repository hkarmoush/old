// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponseDTO _$SearchResponseDTOFromJson(Map<String, dynamic> json) =>
    SearchResponseDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => TrackDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      next: json['next'] as String,
    );

Map<String, dynamic> _$SearchResponseDTOToJson(SearchResponseDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'next': instance.next,
    };
