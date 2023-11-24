// album_dto.dart
import 'package:json_annotation/json_annotation.dart';

part 'album_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AlbumDTO {
  AlbumDTO({
    required this.id,
    required this.title,
    required this.cover,
    required this.coverSmall,
    required this.coverMedium,
    required this.coverBig,
    required this.coverXl,
    required this.md5Image,
    required this.tracklist,
    required this.type,
  });

  factory AlbumDTO.fromJson(Map<String, dynamic> json) =>
      _$AlbumDTOFromJson(json);

  final int id;
  final String title;
  final String cover;
  final String coverSmall;
  final String coverMedium;
  final String coverBig;
  final String coverXl;
  final String md5Image;
  final String tracklist;
  final String type;

  Map<String, dynamic> toJson() => _$AlbumDTOToJson(this);
}
