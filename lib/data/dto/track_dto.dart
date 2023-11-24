import 'package:json_annotation/json_annotation.dart';
import 'package:old/data/dto/album_dto.dart';
import 'package:old/data/dto/artist_dto.dart';

part 'track_dto.g.dart';

@JsonSerializable()
class TrackDTO {
  TrackDTO({
    required this.id,
    required this.readable,
    required this.title,
    required this.titleShort,
    required this.titleVersion,
    required this.link,
    required this.duration,
    required this.rank,
    required this.explicitLyrics,
    required this.explicitContentLyrics,
    required this.explicitContentCover,
    required this.preview,
    required this.md5Image,
    required this.artist,
    required this.album,
    required this.type,
  });

  factory TrackDTO.fromJson(Map<String, dynamic> json) =>
      _$TrackDTOFromJson(json);

  final int id;
  final bool readable;
  final String title;
  final String titleShort;
  final String titleVersion;
  final String link;
  final int duration;
  final int rank;
  final bool explicitLyrics;
  final int explicitContentLyrics;
  final int explicitContentCover;
  final String preview;
  final String md5Image;
  final ArtistDTO artist;
  final AlbumDTO album;
  final String type;

  Map<String, dynamic> toJson() => _$TrackDTOToJson(this);
}
