// search_response_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:old/data/dto/response/search_response_dto.dart';
import 'package:old/domain/entities/track_entity.dart';

part 'search_response_entity.freezed.dart';

@freezed
class SearchResponseEntity with _$SearchResponseEntity {
  factory SearchResponseEntity({
    required List<TrackEntity> data,
    required int total,
    required String next,
  }) = _SearchResponseEntity;

  factory SearchResponseEntity.fromDTO(SearchResponseDTO dto) {
    return SearchResponseEntity(
      data: dto.data.map(TrackEntity.fromDTO).toList(),
      total: dto.total,
      next: dto.next,
    );
  }
}
