// artist_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:old/data/dto/artist_dto.dart';

part 'artist_entity.freezed.dart';

@freezed
class ArtistEntity with _$ArtistEntity {
  factory ArtistEntity({
    required int id,
    required String name,
    required String link,
    required String picture,
    required String pictureSmall,
    required String pictureMedium,
    required String pictureBig,
    required String pictureXl,
    required String tracklist,
    required String type,
  }) = _ArtistEntity;

  factory ArtistEntity.fromDTO(ArtistDTO dto) {
    return ArtistEntity(
      id: dto.id,
      name: dto.name,
      link: dto.link,
      picture: dto.picture,
      pictureSmall: dto.pictureSmall,
      pictureMedium: dto.pictureMedium,
      pictureBig: dto.pictureBig,
      pictureXl: dto.pictureXl,
      tracklist: dto.tracklist,
      type: dto.type,
    );
  }
}
