// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchResponseEntity {
  List<TrackEntity> get data => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  String get next => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchResponseEntityCopyWith<SearchResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResponseEntityCopyWith<$Res> {
  factory $SearchResponseEntityCopyWith(SearchResponseEntity value,
          $Res Function(SearchResponseEntity) then) =
      _$SearchResponseEntityCopyWithImpl<$Res, SearchResponseEntity>;
  @useResult
  $Res call({List<TrackEntity> data, int total, String next});
}

/// @nodoc
class _$SearchResponseEntityCopyWithImpl<$Res,
        $Val extends SearchResponseEntity>
    implements $SearchResponseEntityCopyWith<$Res> {
  _$SearchResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? next = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TrackEntity>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchResponseEntityImplCopyWith<$Res>
    implements $SearchResponseEntityCopyWith<$Res> {
  factory _$$SearchResponseEntityImplCopyWith(_$SearchResponseEntityImpl value,
          $Res Function(_$SearchResponseEntityImpl) then) =
      __$$SearchResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TrackEntity> data, int total, String next});
}

/// @nodoc
class __$$SearchResponseEntityImplCopyWithImpl<$Res>
    extends _$SearchResponseEntityCopyWithImpl<$Res, _$SearchResponseEntityImpl>
    implements _$$SearchResponseEntityImplCopyWith<$Res> {
  __$$SearchResponseEntityImplCopyWithImpl(_$SearchResponseEntityImpl _value,
      $Res Function(_$SearchResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? next = null,
  }) {
    return _then(_$SearchResponseEntityImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TrackEntity>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchResponseEntityImpl implements _SearchResponseEntity {
  _$SearchResponseEntityImpl(
      {required final List<TrackEntity> data,
      required this.total,
      required this.next})
      : _data = data;

  final List<TrackEntity> _data;
  @override
  List<TrackEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int total;
  @override
  final String next;

  @override
  String toString() {
    return 'SearchResponseEntity(data: $data, total: $total, next: $next)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResponseEntityImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.next, next) || other.next == next));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), total, next);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResponseEntityImplCopyWith<_$SearchResponseEntityImpl>
      get copyWith =>
          __$$SearchResponseEntityImplCopyWithImpl<_$SearchResponseEntityImpl>(
              this, _$identity);
}

abstract class _SearchResponseEntity implements SearchResponseEntity {
  factory _SearchResponseEntity(
      {required final List<TrackEntity> data,
      required final int total,
      required final String next}) = _$SearchResponseEntityImpl;

  @override
  List<TrackEntity> get data;
  @override
  int get total;
  @override
  String get next;
  @override
  @JsonKey(ignore: true)
  _$$SearchResponseEntityImplCopyWith<_$SearchResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
