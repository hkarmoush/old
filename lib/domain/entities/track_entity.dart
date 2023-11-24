// track_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:old/data/dto/track_dto.dart';
import 'package:old/domain/entities/album_entity.dart';
import 'package:old/domain/entities/artist_entity.dart';

part 'track_entity.freezed.dart';

@freezed
class TrackEntity with _$TrackEntity {
  factory TrackEntity({
    required int id,
    required bool readable,
    required String title,
    required String titleShort,
    required String titleVersion,
    required String link,
    required int duration,
    required int rank,
    required bool explicitLyrics,
    required int explicitContentLyrics,
    required int explicitContentCover,
    required String preview,
    required String md5Image,
    required ArtistEntity artist,
    required AlbumEntity album,
    required String type,
  }) = _TrackEntity;

  factory TrackEntity.fromDTO(TrackDTO dto) {
    return TrackEntity(
      id: dto.id,
      readable: dto.readable,
      title: dto.title,
      titleShort: dto.titleShort,
      titleVersion: dto.titleVersion,
      link: dto.link,
      duration: dto.duration,
      rank: dto.rank,
      explicitLyrics: dto.explicitLyrics,
      explicitContentLyrics: dto.explicitContentLyrics,
      explicitContentCover: dto.explicitContentCover,
      preview: dto.preview,
      md5Image: dto.md5Image,
      artist: ArtistEntity.fromDTO(dto.artist),
      album: AlbumEntity.fromDTO(dto.album),
      type: dto.type,
    );
  }
}
