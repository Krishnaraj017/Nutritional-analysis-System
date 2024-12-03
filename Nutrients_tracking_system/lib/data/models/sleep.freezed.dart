// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Sleep _$SleepFromJson(Map<String, dynamic> json) {
  return _Sleep.fromJson(json);
}

/// @nodoc
mixin _$Sleep {
  @Index(unique: true, replace: true)
  DateTime get date => throw _privateConstructorUsedError;
  DateTime? get cloudUpdatedAt => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  DateTime get localUpdatedAt => throw _privateConstructorUsedError;
  SleepLog? get sleepLog => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SleepCopyWith<Sleep> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepCopyWith<$Res> {
  factory $SleepCopyWith(Sleep value, $Res Function(Sleep) then) =
      _$SleepCopyWithImpl<$Res, Sleep>;
  @useResult
  $Res call(
      {@Index(unique: true, replace: true) DateTime date,
      DateTime? cloudUpdatedAt,
      @JsonKey(includeToJson: false) DateTime localUpdatedAt,
      SleepLog? sleepLog});

  $SleepLogCopyWith<$Res>? get sleepLog;
}

/// @nodoc
class _$SleepCopyWithImpl<$Res, $Val extends Sleep>
    implements $SleepCopyWith<$Res> {
  _$SleepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? cloudUpdatedAt = freezed,
    Object? localUpdatedAt = null,
    Object? sleepLog = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cloudUpdatedAt: freezed == cloudUpdatedAt
          ? _value.cloudUpdatedAt
          : cloudUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      localUpdatedAt: null == localUpdatedAt
          ? _value.localUpdatedAt
          : localUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sleepLog: freezed == sleepLog
          ? _value.sleepLog
          : sleepLog // ignore: cast_nullable_to_non_nullable
              as SleepLog?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SleepLogCopyWith<$Res>? get sleepLog {
    if (_value.sleepLog == null) {
      return null;
    }

    return $SleepLogCopyWith<$Res>(_value.sleepLog!, (value) {
      return _then(_value.copyWith(sleepLog: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SleepImplCopyWith<$Res> implements $SleepCopyWith<$Res> {
  factory _$$SleepImplCopyWith(
          _$SleepImpl value, $Res Function(_$SleepImpl) then) =
      __$$SleepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Index(unique: true, replace: true) DateTime date,
      DateTime? cloudUpdatedAt,
      @JsonKey(includeToJson: false) DateTime localUpdatedAt,
      SleepLog? sleepLog});

  @override
  $SleepLogCopyWith<$Res>? get sleepLog;
}

/// @nodoc
class __$$SleepImplCopyWithImpl<$Res>
    extends _$SleepCopyWithImpl<$Res, _$SleepImpl>
    implements _$$SleepImplCopyWith<$Res> {
  __$$SleepImplCopyWithImpl(
      _$SleepImpl _value, $Res Function(_$SleepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? cloudUpdatedAt = freezed,
    Object? localUpdatedAt = null,
    Object? sleepLog = freezed,
  }) {
    return _then(_$SleepImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cloudUpdatedAt: freezed == cloudUpdatedAt
          ? _value.cloudUpdatedAt
          : cloudUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      localUpdatedAt: null == localUpdatedAt
          ? _value.localUpdatedAt
          : localUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sleepLog: freezed == sleepLog
          ? _value.sleepLog
          : sleepLog // ignore: cast_nullable_to_non_nullable
              as SleepLog?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SleepImpl extends _Sleep {
  _$SleepImpl(
      {@Index(unique: true, replace: true) required this.date,
      this.cloudUpdatedAt,
      @JsonKey(includeToJson: false) required this.localUpdatedAt,
      this.sleepLog})
      : super._();

  factory _$SleepImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepImplFromJson(json);

  @override
  @Index(unique: true, replace: true)
  final DateTime date;
  @override
  final DateTime? cloudUpdatedAt;
  @override
  @JsonKey(includeToJson: false)
  final DateTime localUpdatedAt;
  @override
  final SleepLog? sleepLog;

  @override
  String toString() {
    return 'Sleep(date: $date, cloudUpdatedAt: $cloudUpdatedAt, localUpdatedAt: $localUpdatedAt, sleepLog: $sleepLog)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.cloudUpdatedAt, cloudUpdatedAt) ||
                other.cloudUpdatedAt == cloudUpdatedAt) &&
            (identical(other.localUpdatedAt, localUpdatedAt) ||
                other.localUpdatedAt == localUpdatedAt) &&
            (identical(other.sleepLog, sleepLog) ||
                other.sleepLog == sleepLog));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, cloudUpdatedAt, localUpdatedAt, sleepLog);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepImplCopyWith<_$SleepImpl> get copyWith =>
      __$$SleepImplCopyWithImpl<_$SleepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepImplToJson(
      this,
    );
  }
}

abstract class _Sleep extends Sleep {
  factory _Sleep(
      {@Index(unique: true, replace: true) required final DateTime date,
      final DateTime? cloudUpdatedAt,
      @JsonKey(includeToJson: false) required final DateTime localUpdatedAt,
      final SleepLog? sleepLog}) = _$SleepImpl;
  _Sleep._() : super._();

  factory _Sleep.fromJson(Map<String, dynamic> json) = _$SleepImpl.fromJson;

  @override
  @Index(unique: true, replace: true)
  DateTime get date;
  @override
  DateTime? get cloudUpdatedAt;
  @override
  @JsonKey(includeToJson: false)
  DateTime get localUpdatedAt;
  @override
  SleepLog? get sleepLog;
  @override
  @JsonKey(ignore: true)
  _$$SleepImplCopyWith<_$SleepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SleepLog _$SleepLogFromJson(Map<String, dynamic> json) {
  return _SleepLog.fromJson(json);
}

/// @nodoc
mixin _$SleepLog {
  /// 24 hour format "HH:mm"
  String? get sleepStartTime => throw _privateConstructorUsedError;

  /// 24 hour format "HH:mm"
  String? get sleepEndTime => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SleepLogCopyWith<SleepLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepLogCopyWith<$Res> {
  factory $SleepLogCopyWith(SleepLog value, $Res Function(SleepLog) then) =
      _$SleepLogCopyWithImpl<$Res, SleepLog>;
  @useResult
  $Res call({String? sleepStartTime, String? sleepEndTime, String? remarks});
}

/// @nodoc
class _$SleepLogCopyWithImpl<$Res, $Val extends SleepLog>
    implements $SleepLogCopyWith<$Res> {
  _$SleepLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sleepStartTime = freezed,
    Object? sleepEndTime = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_value.copyWith(
      sleepStartTime: freezed == sleepStartTime
          ? _value.sleepStartTime
          : sleepStartTime // ignore: cast_nullable_to_non_nullable
              as String?,
      sleepEndTime: freezed == sleepEndTime
          ? _value.sleepEndTime
          : sleepEndTime // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SleepLogImplCopyWith<$Res>
    implements $SleepLogCopyWith<$Res> {
  factory _$$SleepLogImplCopyWith(
          _$SleepLogImpl value, $Res Function(_$SleepLogImpl) then) =
      __$$SleepLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? sleepStartTime, String? sleepEndTime, String? remarks});
}

/// @nodoc
class __$$SleepLogImplCopyWithImpl<$Res>
    extends _$SleepLogCopyWithImpl<$Res, _$SleepLogImpl>
    implements _$$SleepLogImplCopyWith<$Res> {
  __$$SleepLogImplCopyWithImpl(
      _$SleepLogImpl _value, $Res Function(_$SleepLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sleepStartTime = freezed,
    Object? sleepEndTime = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_$SleepLogImpl(
      sleepStartTime: freezed == sleepStartTime
          ? _value.sleepStartTime
          : sleepStartTime // ignore: cast_nullable_to_non_nullable
              as String?,
      sleepEndTime: freezed == sleepEndTime
          ? _value.sleepEndTime
          : sleepEndTime // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SleepLogImpl extends _SleepLog {
  const _$SleepLogImpl({this.sleepStartTime, this.sleepEndTime, this.remarks})
      : super._();

  factory _$SleepLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepLogImplFromJson(json);

  /// 24 hour format "HH:mm"
  @override
  final String? sleepStartTime;

  /// 24 hour format "HH:mm"
  @override
  final String? sleepEndTime;
  @override
  final String? remarks;

  @override
  String toString() {
    return 'SleepLog(sleepStartTime: $sleepStartTime, sleepEndTime: $sleepEndTime, remarks: $remarks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepLogImpl &&
            (identical(other.sleepStartTime, sleepStartTime) ||
                other.sleepStartTime == sleepStartTime) &&
            (identical(other.sleepEndTime, sleepEndTime) ||
                other.sleepEndTime == sleepEndTime) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sleepStartTime, sleepEndTime, remarks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepLogImplCopyWith<_$SleepLogImpl> get copyWith =>
      __$$SleepLogImplCopyWithImpl<_$SleepLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepLogImplToJson(
      this,
    );
  }
}

abstract class _SleepLog extends SleepLog {
  const factory _SleepLog(
      {final String? sleepStartTime,
      final String? sleepEndTime,
      final String? remarks}) = _$SleepLogImpl;
  const _SleepLog._() : super._();

  factory _SleepLog.fromJson(Map<String, dynamic> json) =
      _$SleepLogImpl.fromJson;

  @override

  /// 24 hour format "HH:mm"
  String? get sleepStartTime;
  @override

  /// 24 hour format "HH:mm"
  String? get sleepEndTime;
  @override
  String? get remarks;
  @override
  @JsonKey(ignore: true)
  _$$SleepLogImplCopyWith<_$SleepLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
