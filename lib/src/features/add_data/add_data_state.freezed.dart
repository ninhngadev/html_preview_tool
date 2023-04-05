// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddDataState _$AddDataStateFromJson(Map<String, dynamic> json) {
  return _AddDataState.fromJson(json);
}

/// @nodoc
mixin _$AddDataState {
  String get id => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddDataStateCopyWith<AddDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddDataStateCopyWith<$Res> {
  factory $AddDataStateCopyWith(
          AddDataState value, $Res Function(AddDataState) then) =
      _$AddDataStateCopyWithImpl<$Res, AddDataState>;
  @useResult
  $Res call({String id, bool loading, bool done, String? image});
}

/// @nodoc
class _$AddDataStateCopyWithImpl<$Res, $Val extends AddDataState>
    implements $AddDataStateCopyWith<$Res> {
  _$AddDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? loading = null,
    Object? done = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddDataStateCopyWith<$Res>
    implements $AddDataStateCopyWith<$Res> {
  factory _$$_AddDataStateCopyWith(
          _$_AddDataState value, $Res Function(_$_AddDataState) then) =
      __$$_AddDataStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, bool loading, bool done, String? image});
}

/// @nodoc
class __$$_AddDataStateCopyWithImpl<$Res>
    extends _$AddDataStateCopyWithImpl<$Res, _$_AddDataState>
    implements _$$_AddDataStateCopyWith<$Res> {
  __$$_AddDataStateCopyWithImpl(
      _$_AddDataState _value, $Res Function(_$_AddDataState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? loading = null,
    Object? done = null,
    Object? image = freezed,
  }) {
    return _then(_$_AddDataState(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_AddDataState implements _AddDataState {
  const _$_AddDataState(
      {this.id = '', this.loading = false, this.done = false, this.image});

  factory _$_AddDataState.fromJson(Map<String, dynamic> json) =>
      _$$_AddDataStateFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool done;
  @override
  final String? image;

  @override
  String toString() {
    return 'AddDataState(id: $id, loading: $loading, done: $done, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddDataState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, loading, done, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddDataStateCopyWith<_$_AddDataState> get copyWith =>
      __$$_AddDataStateCopyWithImpl<_$_AddDataState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddDataStateToJson(
      this,
    );
  }
}

abstract class _AddDataState implements AddDataState {
  const factory _AddDataState(
      {final String id,
      final bool loading,
      final bool done,
      final String? image}) = _$_AddDataState;

  factory _AddDataState.fromJson(Map<String, dynamic> json) =
      _$_AddDataState.fromJson;

  @override
  String get id;
  @override
  bool get loading;
  @override
  bool get done;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_AddDataStateCopyWith<_$_AddDataState> get copyWith =>
      throw _privateConstructorUsedError;
}
