// search_response_dto.dart
import 'package:json_annotation/json_annotation.dart';
import 'package:old/data/dto/track_dto.dart';

part 'search_response_dto.g.dart';

@JsonSerializable()
class SearchResponseDTO {
  SearchResponseDTO({
    required this.data,
    required this.total,
    required this.next,
  });

  factory SearchResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseDTOFromJson(json);

  final List<TrackDTO> data;
  final int total;
  final String next;

  Map<String, dynamic> toJson() => _$SearchResponseDTOToJson(this);
}
