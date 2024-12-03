// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SyncParams _$SyncParamsFromJson(Map<String, dynamic> json) {
  return _SyncParams.fromJson(json);
}

/// @nodoc
mixin _$SyncParams {
  List<Hydration> get hydration => throw _privateConstructorUsedError;
  List<Sleep> get sleep => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncParamsCopyWith<SyncParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncParamsCopyWith<$Res> {
  factory $SyncParamsCopyWith(
          SyncParams value, $Res Function(SyncParams) then) =
      _$SyncParamsCopyWithImpl<$Res, SyncParams>;
  @useResult
  $Res call({List<Hydration> hydration, List<Sleep> sleep});
}

/// @nodoc
class _$SyncParamsCopyWithImpl<$Res, $Val extends SyncParams>
    implements $SyncParamsCopyWith<$Res> {
  _$SyncParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hydration = null,
    Object? sleep = null,
  }) {
    return _then(_value.copyWith(
      hydration: null == hydration
          ? _value.hydration
          : hydration // ignore: cast_nullable_to_non_nullable
              as List<Hydration>,
      sleep: null == sleep
          ? _value.sleep
          : sleep // ignore: cast_nullable_to_non_nullable
              as List<Sleep>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncParamsImplCopyWith<$Res>
    implements $SyncParamsCopyWith<$Res> {
  factory _$$SyncParamsImplCopyWith(
          _$SyncParamsImpl value, $Res Function(_$SyncParamsImpl) then) =
      __$$SyncParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Hydration> hydration, List<Sleep> sleep});
}

/// @nodoc
class __$$SyncParamsImplCopyWithImpl<$Res>
    extends _$SyncParamsCopyWithImpl<$Res, _$SyncParamsImpl>
    implements _$$SyncParamsImplCopyWith<$Res> {
  __$$SyncParamsImplCopyWithImpl(
      _$SyncParamsImpl _value, $Res Function(_$SyncParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hydration = null,
    Object? sleep = null,
  }) {
    return _then(_$SyncParamsImpl(
      hydration: null == hydration
          ? _value._hydration
          : hydration // ignore: cast_nullable_to_non_nullable
              as List<Hydration>,
      sleep: null == sleep
          ? _value._sleep
          : sleep // ignore: cast_nullable_to_non_nullable
              as List<Sleep>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncParamsImpl implements _SyncParams {
  const _$SyncParamsImpl(
      {required final List<Hydration> hydration,
      required final List<Sleep> sleep})
      : _hydration = hydration,
        _sleep = sleep;

  factory _$SyncParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncParamsImplFromJson(json);

  final List<Hydration> _hydration;
  @override
  List<Hydration> get hydration {
    if (_hydration is EqualUnmodifiableListView) return _hydration;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hydration);
  }

  final List<Sleep> _sleep;
  @override
  List<Sleep> get sleep {
    if (_sleep is EqualUnmodifiableListView) return _sleep;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sleep);
  }

  @override
  String toString() {
    return 'SyncParams(hydration: $hydration, sleep: $sleep)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncParamsImpl &&
            const DeepCollectionEquality()
                .equals(other._hydration, _hydration) &&
            const DeepCollectionEquality().equals(other._sleep, _sleep));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_hydration),
      const DeepCollectionEquality().hash(_sleep));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncParamsImplCopyWith<_$SyncParamsImpl> get copyWith =>
      __$$SyncParamsImplCopyWithImpl<_$SyncParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncParamsImplToJson(
      this,
    );
  }
}

abstract class _SyncParams implements SyncParams {
  const factory _SyncParams(
      {required final List<Hydration> hydration,
      required final List<Sleep> sleep}) = _$SyncParamsImpl;

  factory _SyncParams.fromJson(Map<String, dynamic> json) =
      _$SyncParamsImpl.fromJson;

  @override
  List<Hydration> get hydration;
  @override
  List<Sleep> get sleep;
  @override
  @JsonKey(ignore: true)
  _$$SyncParamsImplCopyWith<_$SyncParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
