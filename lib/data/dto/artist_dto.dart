// artist_dto.dart
import 'package:json_annotation/json_annotation.dart';

part 'artist_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ArtistDTO {
  ArtistDTO({
    required this.id,
    required this.name,
    required this.link,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.tracklist,
    required this.type,
  });

  factory ArtistDTO.fromJson(Map<String, dynamic> json) =>
      _$ArtistDTOFromJson(json);

  final int id;
  final String name;
  final String link;
  final String picture;
  final String pictureSmall;
  final String pictureMedium;
  final String pictureBig;
  final String pictureXl;
  final String tracklist;
  final String type;

  Map<String, dynamic> toJson() => _$ArtistDTOToJson(this);
}
