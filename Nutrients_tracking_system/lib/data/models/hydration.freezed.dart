// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hydration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Hydration _$HydrationFromJson(Map<String, dynamic> json) {
  return _Hydration.fromJson(json);
}

/// @nodoc
mixin _$Hydration {
  @Index(unique: true, replace: true)
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(toJson: _intToString, fromJson: _stringToInt)
  int get target => throw _privateConstructorUsedError;
  @JsonKey(name: 'updationTime')
  DateTime? get cloudUpdatedAt => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  DateTime get localUpdatedAt => throw _privateConstructorUsedError;
  HydrationLog get log => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HydrationCopyWith<Hydration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HydrationCopyWith<$Res> {
  factory $HydrationCopyWith(Hydration value, $Res Function(Hydration) then) =
      _$HydrationCopyWithImpl<$Res, Hydration>;
  @useResult
  $Res call(
      {@Index(unique: true, replace: true) DateTime date,
      @JsonKey(toJson: _intToString, fromJson: _stringToInt) int target,
      @JsonKey(name: 'updationTime') DateTime? cloudUpdatedAt,
      @JsonKey(includeToJson: false) DateTime localUpdatedAt,
      HydrationLog log});

  $HydrationLogCopyWith<$Res> get log;
}

/// @nodoc
class _$HydrationCopyWithImpl<$Res, $Val extends Hydration>
    implements $HydrationCopyWith<$Res> {
  _$HydrationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? target = null,
    Object? cloudUpdatedAt = freezed,
    Object? localUpdatedAt = null,
    Object? log = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as int,
      cloudUpdatedAt: freezed == cloudUpdatedAt
          ? _value.cloudUpdatedAt
          : cloudUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      localUpdatedAt: null == localUpdatedAt
          ? _value.localUpdatedAt
          : localUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      log: null == log
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as HydrationLog,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HydrationLogCopyWith<$Res> get log {
    return $HydrationLogCopyWith<$Res>(_value.log, (value) {
      return _then(_value.copyWith(log: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HydrationImplCopyWith<$Res>
    implements $HydrationCopyWith<$Res> {
  factory _$$HydrationImplCopyWith(
          _$HydrationImpl value, $Res Function(_$HydrationImpl) then) =
      __$$HydrationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Index(unique: true, replace: true) DateTime date,
      @JsonKey(toJson: _intToString, fromJson: _stringToInt) int target,
      @JsonKey(name: 'updationTime') DateTime? cloudUpdatedAt,
      @JsonKey(includeToJson: false) DateTime localUpdatedAt,
      HydrationLog log});

  @override
  $HydrationLogCopyWith<$Res> get log;
}

/// @nodoc
class __$$HydrationImplCopyWithImpl<$Res>
    extends _$HydrationCopyWithImpl<$Res, _$HydrationImpl>
    implements _$$HydrationImplCopyWith<$Res> {
  __$$HydrationImplCopyWithImpl(
      _$HydrationImpl _value, $Res Function(_$HydrationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? target = null,
    Object? cloudUpdatedAt = freezed,
    Object? localUpdatedAt = null,
    Object? log = null,
  }) {
    return _then(_$HydrationImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as int,
      cloudUpdatedAt: freezed == cloudUpdatedAt
          ? _value.cloudUpdatedAt
          : cloudUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      localUpdatedAt: null == localUpdatedAt
          ? _value.localUpdatedAt
          : localUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      log: null == log
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as HydrationLog,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HydrationImpl extends _Hydration {
  const _$HydrationImpl(
      {@Index(unique: true, replace: true) required this.date,
      @JsonKey(toJson: _intToString, fromJson: _stringToInt)
      required this.target,
      @JsonKey(name: 'updationTime') this.cloudUpdatedAt,
      @JsonKey(includeToJson: false) required this.localUpdatedAt,
      this.log = const HydrationLog()})
      : super._();

  factory _$HydrationImpl.fromJson(Map<String, dynamic> json) =>
      _$$HydrationImplFromJson(json);

  @override
  @Index(unique: true, replace: true)
  final DateTime date;
  @override
  @JsonKey(toJson: _intToString, fromJson: _stringToInt)
  final int target;
  @override
  @JsonKey(name: 'updationTime')
  final DateTime? cloudUpdatedAt;
  @override
  @JsonKey(includeToJson: false)
  final DateTime localUpdatedAt;
  @override
  @JsonKey()
  final HydrationLog log;

  @override
  String toString() {
    return 'Hydration(date: $date, target: $target, cloudUpdatedAt: $cloudUpdatedAt, localUpdatedAt: $localUpdatedAt, log: $log)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HydrationImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.cloudUpdatedAt, cloudUpdatedAt) ||
                other.cloudUpdatedAt == cloudUpdatedAt) &&
            (identical(other.localUpdatedAt, localUpdatedAt) ||
                other.localUpdatedAt == localUpdatedAt) &&
            (identical(other.log, log) || other.log == log));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, target, cloudUpdatedAt, localUpdatedAt, log);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HydrationImplCopyWith<_$HydrationImpl> get copyWith =>
      __$$HydrationImplCopyWithImpl<_$HydrationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HydrationImplToJson(
      this,
    );
  }
}

abstract class _Hydration extends Hydration {
  const factory _Hydration(
      {@Index(unique: true, replace: true) required final DateTime date,
      @JsonKey(toJson: _intToString, fromJson: _stringToInt)
      required final int target,
      @JsonKey(name: 'updationTime') final DateTime? cloudUpdatedAt,
      @JsonKey(includeToJson: false) required final DateTime localUpdatedAt,
      final HydrationLog log}) = _$HydrationImpl;
  const _Hydration._() : super._();

  factory _Hydration.fromJson(Map<String, dynamic> json) =
      _$HydrationImpl.fromJson;

  @override
  @Index(unique: true, replace: true)
  DateTime get date;
  @override
  @JsonKey(toJson: _intToString, fromJson: _stringToInt)
  int get target;
  @override
  @JsonKey(name: 'updationTime')
  DateTime? get cloudUpdatedAt;
  @override
  @JsonKey(includeToJson: false)
  DateTime get localUpdatedAt;
  @override
  HydrationLog get log;
  @override
  @JsonKey(ignore: true)
  _$$HydrationImplCopyWith<_$HydrationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HydrationLog _$HydrationLogFromJson(Map<String, dynamic> json) {
  return _HydrationLog.fromJson(json);
}

/// @nodoc
mixin _$HydrationLog {
  @JsonKey(toJson: _intToString, fromJson: _stringToInt)
  int get mor => throw _privateConstructorUsedError;
  @JsonKey(toJson: _intToString, fromJson: _stringToInt)
  int get aft => throw _privateConstructorUsedError;
  @JsonKey(toJson: _intToString, fromJson: _stringToInt)
  int get eve => throw _privateConstructorUsedError;
  @JsonKey(toJson: _intToString, fromJson: _stringToInt)
  int get nig => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HydrationLogCopyWith<HydrationLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HydrationLogCopyWith<$Res> {
  factory $HydrationLogCopyWith(
          HydrationLog value, $Res Function(HydrationLog) then) =
      _$HydrationLogCopyWithImpl<$Res, HydrationLog>;
  @useResult
  $Res call(
      {@JsonKey(toJson: _intToString, fromJson: _stringToInt) int mor,
      @JsonKey(toJson: _intToString, fromJson: _stringToInt) int aft,
      @JsonKey(toJson: _intToString, fromJson: _stringToInt) int eve,
      @JsonKey(toJson: _intToString, fromJson: _stringToInt) int nig});
}

/// @nodoc
class _$HydrationLogCopyWithImpl<$Res, $Val extends HydrationLog>
    implements $HydrationLogCopyWith<$Res> {
  _$HydrationLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mor = null,
    Object? aft = null,
    Object? eve = null,
    Object? nig = null,
  }) {
    return _then(_value.copyWith(
      mor: null == mor
          ? _value.mor
          : mor // ignore: cast_nullable_to_non_nullable
              as int,
      aft: null == aft
          ? _value.aft
          : aft // ignore: cast_nullable_to_non_nullable
              as int,
      eve: null == eve
          ? _value.eve
          : eve // ignore: cast_nullable_to_non_nullable
              as int,
      nig: null == nig
          ? _value.nig
          : nig // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HydrationLogImplCopyWith<$Res>
    implements $HydrationLogCopyWith<$Res> {
  factory _$$HydrationLogImplCopyWith(
          _$HydrationLogImpl value, $Res Function(_$HydrationLogImpl) then) =
      __$$HydrationLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(toJson: _intToString, fromJson: _stringToInt) int mor,
      @JsonKey(toJson: _intToString, fromJson: _stringToInt) int aft,
      @JsonKey(toJson: _intToString, fromJson: _stringToInt) int eve,
      @JsonKey(toJson: _intToString, fromJson: _stringToInt) int nig});
}

/// @nodoc
class __$$HydrationLogImplCopyWithImpl<$Res>
    extends _$HydrationLogCopyWithImpl<$Res, _$HydrationLogImpl>
    implements _$$HydrationLogImplCopyWith<$Res> {
  __$$HydrationLogImplCopyWithImpl(
      _$HydrationLogImpl _value, $Res Function(_$HydrationLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mor = null,
    Object? aft = null,
    Object? eve = null,
    Object? nig = null,
  }) {
    return _then(_$HydrationLogImpl(
      mor: null == mor
          ? _value.mor
          : mor // ignore: cast_nullable_to_non_nullable
              as int,
      aft: null == aft
          ? _value.aft
          : aft // ignore: cast_nullable_to_non_nullable
              as int,
      eve: null == eve
          ? _value.eve
          : eve // ignore: cast_nullable_to_non_nullable
              as int,
      nig: null == nig
          ? _value.nig
          : nig // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HydrationLogImpl extends _HydrationLog {
  const _$HydrationLogImpl(
      {@JsonKey(toJson: _intToString, fromJson: _stringToInt) this.mor = 0,
      @JsonKey(toJson: _intToString, fromJson: _stringToInt) this.aft = 0,
      @JsonKey(toJson: _intToString, fromJson: _stringToInt) this.eve = 0,
      @JsonKey(toJson: _intToString, fromJson: _stringToInt) this.nig = 0})
      : super._();

  factory _$HydrationLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$HydrationLogImplFromJson(json);

  @override
  @JsonKey(toJson: _intToString, fromJson: _stringToInt)
  final int mor;
  @override
  @JsonKey(toJson: _intToString, fromJson: _stringToInt)
  final int aft;
  @override
  @JsonKey(toJson: _intToString, fromJson: _stringToInt)
  final int eve;
  @override
  @JsonKey(toJson: _intToString, fromJson: _stringToInt)
  final int nig;

  @override
  String toString() {
    return 'HydrationLog(mor: $mor, aft: $aft, eve: $eve, nig: $nig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HydrationLogImpl &&
            (identical(other.mor, mor) || other.mor == mor) &&
            (identical(other.aft, aft) || other.aft == aft) &&
            (identical(other.eve, eve) || other.eve == eve) &&
            (identical(other.nig, nig) || other.nig == nig));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mor, aft, eve, nig);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HydrationLogImplCopyWith<_$HydrationLogImpl> get copyWith =>
      __$$HydrationLogImplCopyWithImpl<_$HydrationLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HydrationLogImplToJson(
      this,
    );
  }
}

abstract class _HydrationLog extends HydrationLog {
  const factory _HydrationLog(
      {@JsonKey(toJson: _intToString, fromJson: _stringToInt) final int mor,
      @JsonKey(toJson: _intToString, fromJson: _stringToInt) final int aft,
      @JsonKey(toJson: _intToString, fromJson: _stringToInt) final int eve,
      @JsonKey(toJson: _intToString, fromJson: _stringToInt)
      final int nig}) = _$HydrationLogImpl;
  const _HydrationLog._() : super._();

  factory _HydrationLog.fromJson(Map<String, dynamic> json) =
      _$HydrationLogImpl.fromJson;

  @override
  @JsonKey(toJson: _intToString, fromJson: _stringToInt)
  int get mor;
  @override
  @JsonKey(toJson: _intToString, fromJson: _stringToInt)
  int get aft;
  @override
  @JsonKey(toJson: _intToString, fromJson: _stringToInt)
  int get eve;
  @override
  @JsonKey(toJson: _intToString, fromJson: _stringToInt)
  int get nig;
  @override
  @JsonKey(ignore: true)
  _$$HydrationLogImplCopyWith<_$HydrationLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
