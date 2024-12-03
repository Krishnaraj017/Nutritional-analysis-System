// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_app_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocalAppInfo {
  @HiveField(0, defaultValue: false)
  bool get hisVisited => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalAppInfoCopyWith<LocalAppInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalAppInfoCopyWith<$Res> {
  factory $LocalAppInfoCopyWith(
          LocalAppInfo value, $Res Function(LocalAppInfo) then) =
      _$LocalAppInfoCopyWithImpl<$Res, LocalAppInfo>;
  @useResult
  $Res call({@HiveField(0, defaultValue: false) bool hisVisited});
}

/// @nodoc
class _$LocalAppInfoCopyWithImpl<$Res, $Val extends LocalAppInfo>
    implements $LocalAppInfoCopyWith<$Res> {
  _$LocalAppInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hisVisited = null,
  }) {
    return _then(_value.copyWith(
      hisVisited: null == hisVisited
          ? _value.hisVisited
          : hisVisited // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalAppInfoImplCopyWith<$Res>
    implements $LocalAppInfoCopyWith<$Res> {
  factory _$$LocalAppInfoImplCopyWith(
          _$LocalAppInfoImpl value, $Res Function(_$LocalAppInfoImpl) then) =
      __$$LocalAppInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0, defaultValue: false) bool hisVisited});
}

/// @nodoc
class __$$LocalAppInfoImplCopyWithImpl<$Res>
    extends _$LocalAppInfoCopyWithImpl<$Res, _$LocalAppInfoImpl>
    implements _$$LocalAppInfoImplCopyWith<$Res> {
  __$$LocalAppInfoImplCopyWithImpl(
      _$LocalAppInfoImpl _value, $Res Function(_$LocalAppInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hisVisited = null,
  }) {
    return _then(_$LocalAppInfoImpl(
      hisVisited: null == hisVisited
          ? _value.hisVisited
          : hisVisited // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LocalAppInfoImpl implements _LocalAppInfo {
  const _$LocalAppInfoImpl(
      {@HiveField(0, defaultValue: false) this.hisVisited = false});

  @override
  @JsonKey()
  @HiveField(0, defaultValue: false)
  final bool hisVisited;

  @override
  String toString() {
    return 'LocalAppInfo(hisVisited: $hisVisited)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalAppInfoImpl &&
            (identical(other.hisVisited, hisVisited) ||
                other.hisVisited == hisVisited));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hisVisited);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalAppInfoImplCopyWith<_$LocalAppInfoImpl> get copyWith =>
      __$$LocalAppInfoImplCopyWithImpl<_$LocalAppInfoImpl>(this, _$identity);
}

abstract class _LocalAppInfo implements LocalAppInfo {
  const factory _LocalAppInfo(
          {@HiveField(0, defaultValue: false) final bool hisVisited}) =
      _$LocalAppInfoImpl;

  @override
  @HiveField(0, defaultValue: false)
  bool get hisVisited;
  @override
  @JsonKey(ignore: true)
  _$$LocalAppInfoImplCopyWith<_$LocalAppInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
