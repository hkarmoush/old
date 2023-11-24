// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrackEntity {
  int get id => throw _privateConstructorUsedError;
  bool get readable => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get titleShort => throw _privateConstructorUsedError;
  String get titleVersion => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  bool get explicitLyrics => throw _privateConstructorUsedError;
  int get explicitContentLyrics => throw _privateConstructorUsedError;
  int get explicitContentCover => throw _privateConstructorUsedError;
  String get preview => throw _privateConstructorUsedError;
  String get md5Image => throw _privateConstructorUsedError;
  ArtistEntity get artist => throw _privateConstructorUsedError;
  AlbumEntity get album => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrackEntityCopyWith<TrackEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackEntityCopyWith<$Res> {
  factory $TrackEntityCopyWith(
          TrackEntity value, $Res Function(TrackEntity) then) =
      _$TrackEntityCopyWithImpl<$Res, TrackEntity>;
  @useResult
  $Res call(
      {int id,
      bool readable,
      String title,
      String titleShort,
      String titleVersion,
      String link,
      int duration,
      int rank,
      bool explicitLyrics,
      int explicitContentLyrics,
      int explicitContentCover,
      String preview,
      String md5Image,
      ArtistEntity artist,
      AlbumEntity album,
      String type});

  $ArtistEntityCopyWith<$Res> get artist;
  $AlbumEntityCopyWith<$Res> get album;
}

/// @nodoc
class _$TrackEntityCopyWithImpl<$Res, $Val extends TrackEntity>
    implements $TrackEntityCopyWith<$Res> {
  _$TrackEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? readable = null,
    Object? title = null,
    Object? titleShort = null,
    Object? titleVersion = null,
    Object? link = null,
    Object? duration = null,
    Object? rank = null,
    Object? explicitLyrics = null,
    Object? explicitContentLyrics = null,
    Object? explicitContentCover = null,
    Object? preview = null,
    Object? md5Image = null,
    Object? artist = null,
    Object? album = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      readable: null == readable
          ? _value.readable
          : readable // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleShort: null == titleShort
          ? _value.titleShort
          : titleShort // ignore: cast_nullable_to_non_nullable
              as String,
      titleVersion: null == titleVersion
          ? _value.titleVersion
          : titleVersion // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      explicitLyrics: null == explicitLyrics
          ? _value.explicitLyrics
          : explicitLyrics // ignore: cast_nullable_to_non_nullable
              as bool,
      explicitContentLyrics: null == explicitContentLyrics
          ? _value.explicitContentLyrics
          : explicitContentLyrics // ignore: cast_nullable_to_non_nullable
              as int,
      explicitContentCover: null == explicitContentCover
          ? _value.explicitContentCover
          : explicitContentCover // ignore: cast_nullable_to_non_nullable
              as int,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String,
      md5Image: null == md5Image
          ? _value.md5Image
          : md5Image // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as ArtistEntity,
      album: null == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as AlbumEntity,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtistEntityCopyWith<$Res> get artist {
    return $ArtistEntityCopyWith<$Res>(_value.artist, (value) {
      return _then(_value.copyWith(artist: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AlbumEntityCopyWith<$Res> get album {
    return $AlbumEntityCopyWith<$Res>(_value.album, (value) {
      return _then(_value.copyWith(album: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrackEntityImplCopyWith<$Res>
    implements $TrackEntityCopyWith<$Res> {
  factory _$$TrackEntityImplCopyWith(
          _$TrackEntityImpl value, $Res Function(_$TrackEntityImpl) then) =
      __$$TrackEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      bool readable,
      String title,
      String titleShort,
      String titleVersion,
      String link,
      int duration,
      int rank,
      bool explicitLyrics,
      int explicitContentLyrics,
      int explicitContentCover,
      String preview,
      String md5Image,
      ArtistEntity artist,
      AlbumEntity album,
      String type});

  @override
  $ArtistEntityCopyWith<$Res> get artist;
  @override
  $AlbumEntityCopyWith<$Res> get album;
}

/// @nodoc
class __$$TrackEntityImplCopyWithImpl<$Res>
    extends _$TrackEntityCopyWithImpl<$Res, _$TrackEntityImpl>
    implements _$$TrackEntityImplCopyWith<$Res> {
  __$$TrackEntityImplCopyWithImpl(
      _$TrackEntityImpl _value, $Res Function(_$TrackEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? readable = null,
    Object? title = null,
    Object? titleShort = null,
    Object? titleVersion = null,
    Object? link = null,
    Object? duration = null,
    Object? rank = null,
    Object? explicitLyrics = null,
    Object? explicitContentLyrics = null,
    Object? explicitContentCover = null,
    Object? preview = null,
    Object? md5Image = null,
    Object? artist = null,
    Object? album = null,
    Object? type = null,
  }) {
    return _then(_$TrackEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      readable: null == readable
          ? _value.readable
          : readable // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleShort: null == titleShort
          ? _value.titleShort
          : titleShort // ignore: cast_nullable_to_non_nullable
              as String,
      titleVersion: null == titleVersion
          ? _value.titleVersion
          : titleVersion // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      explicitLyrics: null == explicitLyrics
          ? _value.explicitLyrics
          : explicitLyrics // ignore: cast_nullable_to_non_nullable
              as bool,
      explicitContentLyrics: null == explicitContentLyrics
          ? _value.explicitContentLyrics
          : explicitContentLyrics // ignore: cast_nullable_to_non_nullable
              as int,
      explicitContentCover: null == explicitContentCover
          ? _value.explicitContentCover
          : explicitContentCover // ignore: cast_nullable_to_non_nullable
              as int,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String,
      md5Image: null == md5Image
          ? _value.md5Image
          : md5Image // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as ArtistEntity,
      album: null == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as AlbumEntity,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TrackEntityImpl implements _TrackEntity {
  _$TrackEntityImpl(
      {required this.id,
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
      required this.type});

  @override
  final int id;
  @override
  final bool readable;
  @override
  final String title;
  @override
  final String titleShort;
  @override
  final String titleVersion;
  @override
  final String link;
  @override
  final int duration;
  @override
  final int rank;
  @override
  final bool explicitLyrics;
  @override
  final int explicitContentLyrics;
  @override
  final int explicitContentCover;
  @override
  final String preview;
  @override
  final String md5Image;
  @override
  final ArtistEntity artist;
  @override
  final AlbumEntity album;
  @override
  final String type;

  @override
  String toString() {
    return 'TrackEntity(id: $id, readable: $readable, title: $title, titleShort: $titleShort, titleVersion: $titleVersion, link: $link, duration: $duration, rank: $rank, explicitLyrics: $explicitLyrics, explicitContentLyrics: $explicitContentLyrics, explicitContentCover: $explicitContentCover, preview: $preview, md5Image: $md5Image, artist: $artist, album: $album, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.readable, readable) ||
                other.readable == readable) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleShort, titleShort) ||
                other.titleShort == titleShort) &&
            (identical(other.titleVersion, titleVersion) ||
                other.titleVersion == titleVersion) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.explicitLyrics, explicitLyrics) ||
                other.explicitLyrics == explicitLyrics) &&
            (identical(other.explicitContentLyrics, explicitContentLyrics) ||
                other.explicitContentLyrics == explicitContentLyrics) &&
            (identical(other.explicitContentCover, explicitContentCover) ||
                other.explicitContentCover == explicitContentCover) &&
            (identical(other.preview, preview) || other.preview == preview) &&
            (identical(other.md5Image, md5Image) ||
                other.md5Image == md5Image) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.album, album) || other.album == album) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      readable,
      title,
      titleShort,
      titleVersion,
      link,
      duration,
      rank,
      explicitLyrics,
      explicitContentLyrics,
      explicitContentCover,
      preview,
      md5Image,
      artist,
      album,
      type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackEntityImplCopyWith<_$TrackEntityImpl> get copyWith =>
      __$$TrackEntityImplCopyWithImpl<_$TrackEntityImpl>(this, _$identity);
}

abstract class _TrackEntity implements TrackEntity {
  factory _TrackEntity(
      {required final int id,
      required final bool readable,
      required final String title,
      required final String titleShort,
      required final String titleVersion,
      required final String link,
      required final int duration,
      required final int rank,
      required final bool explicitLyrics,
      required final int explicitContentLyrics,
      required final int explicitContentCover,
      required final String preview,
      required final String md5Image,
      required final ArtistEntity artist,
      required final AlbumEntity album,
      required final String type}) = _$TrackEntityImpl;

  @override
  int get id;
  @override
  bool get readable;
  @override
  String get title;
  @override
  String get titleShort;
  @override
  String get titleVersion;
  @override
  String get link;
  @override
  int get duration;
  @override
  int get rank;
  @override
  bool get explicitLyrics;
  @override
  int get explicitContentLyrics;
  @override
  int get explicitContentCover;
  @override
  String get preview;
  @override
  String get md5Image;
  @override
  ArtistEntity get artist;
  @override
  AlbumEntity get album;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$TrackEntityImplCopyWith<_$TrackEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
