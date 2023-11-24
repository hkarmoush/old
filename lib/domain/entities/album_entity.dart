// album_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:old/data/dto/album_dto.dart';

part 'album_entity.freezed.dart';

@freezed
class AlbumEntity with _$AlbumEntity {
  factory AlbumEntity({
    required int id,
    required String title,
    required String cover,
    required String coverSmall,
    required String coverMedium,
    required String coverBig,
    required String coverXl,
    required String md5Image,
    required String tracklist,
    required String type,
  }) = _AlbumEntity;

  factory AlbumEntity.fromDTO(AlbumDTO dto) {
    return AlbumEntity(
      id: dto.id,
      title: dto.title,
      cover: dto.cover,
      coverSmall: dto.coverSmall,
      coverMedium: dto.coverMedium,
      coverBig: dto.coverBig,
      coverXl: dto.coverXl,
      md5Image: dto.md5Image,
      tracklist: dto.tracklist,
      type: dto.type,
    );
  }
}
