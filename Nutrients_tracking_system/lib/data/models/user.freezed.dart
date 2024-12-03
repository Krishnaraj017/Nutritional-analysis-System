// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @HiveField(0)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateTimeFromString, toJson: _dateTimeToString)
  @HiveField(1)
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  @HiveField(2)
  Gender? get gender => throw _privateConstructorUsedError;
  @HiveField(3)
  double? get weight => throw _privateConstructorUsedError;
  @HiveField(4)
  double? get height => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
  TimeOfDay get wakeUpTime => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
  TimeOfDay get bedTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'isonboardingdone', includeToJson: false)
  @HiveField(7)
  bool get isOnboardingCompleted => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  @HiveField(8, defaultValue: null)
  DateTime? get lastSyncedAt => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  @HiveField(9, defaultValue: false)
  bool get last7daysSynced => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@HiveField(0) String? name,
      @JsonKey(fromJson: _dateTimeFromString, toJson: _dateTimeToString)
      @HiveField(1)
      DateTime? dateOfBirth,
      @HiveField(2) Gender? gender,
      @HiveField(3) double? weight,
      @HiveField(4) double? height,
      @HiveField(5)
      @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
      TimeOfDay wakeUpTime,
      @HiveField(6)
      @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
      TimeOfDay bedTime,
      @JsonKey(name: 'isonboardingdone', includeToJson: false)
      @HiveField(7)
      bool isOnboardingCompleted,
      @JsonKey(includeToJson: false, includeFromJson: false)
      @HiveField(8, defaultValue: null)
      DateTime? lastSyncedAt,
      @JsonKey(includeToJson: false, includeFromJson: false)
      @HiveField(9, defaultValue: false)
      bool last7daysSynced});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? weight = freezed,
    Object? height = freezed,
    Object? wakeUpTime = null,
    Object? bedTime = null,
    Object? isOnboardingCompleted = null,
    Object? lastSyncedAt = freezed,
    Object? last7daysSynced = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      wakeUpTime: null == wakeUpTime
          ? _value.wakeUpTime
          : wakeUpTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      bedTime: null == bedTime
          ? _value.bedTime
          : bedTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      isOnboardingCompleted: null == isOnboardingCompleted
          ? _value.isOnboardingCompleted
          : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      lastSyncedAt: freezed == lastSyncedAt
          ? _value.lastSyncedAt
          : lastSyncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      last7daysSynced: null == last7daysSynced
          ? _value.last7daysSynced
          : last7daysSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? name,
      @JsonKey(fromJson: _dateTimeFromString, toJson: _dateTimeToString)
      @HiveField(1)
      DateTime? dateOfBirth,
      @HiveField(2) Gender? gender,
      @HiveField(3) double? weight,
      @HiveField(4) double? height,
      @HiveField(5)
      @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
      TimeOfDay wakeUpTime,
      @HiveField(6)
      @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
      TimeOfDay bedTime,
      @JsonKey(name: 'isonboardingdone', includeToJson: false)
      @HiveField(7)
      bool isOnboardingCompleted,
      @JsonKey(includeToJson: false, includeFromJson: false)
      @HiveField(8, defaultValue: null)
      DateTime? lastSyncedAt,
      @JsonKey(includeToJson: false, includeFromJson: false)
      @HiveField(9, defaultValue: false)
      bool last7daysSynced});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? weight = freezed,
    Object? height = freezed,
    Object? wakeUpTime = null,
    Object? bedTime = null,
    Object? isOnboardingCompleted = null,
    Object? lastSyncedAt = freezed,
    Object? last7daysSynced = null,
  }) {
    return _then(_$UserImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      wakeUpTime: null == wakeUpTime
          ? _value.wakeUpTime
          : wakeUpTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      bedTime: null == bedTime
          ? _value.bedTime
          : bedTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      isOnboardingCompleted: null == isOnboardingCompleted
          ? _value.isOnboardingCompleted
          : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      lastSyncedAt: freezed == lastSyncedAt
          ? _value.lastSyncedAt
          : lastSyncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      last7daysSynced: null == last7daysSynced
          ? _value.last7daysSynced
          : last7daysSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl extends _User {
  const _$UserImpl(
      {@HiveField(0) this.name,
      @JsonKey(fromJson: _dateTimeFromString, toJson: _dateTimeToString)
      @HiveField(1)
      this.dateOfBirth,
      @HiveField(2) this.gender,
      @HiveField(3) this.weight,
      @HiveField(4) this.height,
      @HiveField(5)
      @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
      this.wakeUpTime = const TimeOfDay(hour: 7, minute: 0),
      @HiveField(6)
      @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
      this.bedTime = const TimeOfDay(hour: 22, minute: 0),
      @JsonKey(name: 'isonboardingdone', includeToJson: false)
      @HiveField(7)
      this.isOnboardingCompleted = false,
      @JsonKey(includeToJson: false, includeFromJson: false)
      @HiveField(8, defaultValue: null)
      this.lastSyncedAt,
      @JsonKey(includeToJson: false, includeFromJson: false)
      @HiveField(9, defaultValue: false)
      this.last7daysSynced = false})
      : super._();

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @HiveField(0)
  final String? name;
  @override
  @JsonKey(fromJson: _dateTimeFromString, toJson: _dateTimeToString)
  @HiveField(1)
  final DateTime? dateOfBirth;
  @override
  @HiveField(2)
  final Gender? gender;
  @override
  @HiveField(3)
  final double? weight;
  @override
  @HiveField(4)
  final double? height;
  @override
  @HiveField(5)
  @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
  final TimeOfDay wakeUpTime;
  @override
  @HiveField(6)
  @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
  final TimeOfDay bedTime;
  @override
  @JsonKey(name: 'isonboardingdone', includeToJson: false)
  @HiveField(7)
  final bool isOnboardingCompleted;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  @HiveField(8, defaultValue: null)
  final DateTime? lastSyncedAt;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  @HiveField(9, defaultValue: false)
  final bool last7daysSynced;

  @override
  String toString() {
    return 'User(name: $name, dateOfBirth: $dateOfBirth, gender: $gender, weight: $weight, height: $height, wakeUpTime: $wakeUpTime, bedTime: $bedTime, isOnboardingCompleted: $isOnboardingCompleted, lastSyncedAt: $lastSyncedAt, last7daysSynced: $last7daysSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.wakeUpTime, wakeUpTime) ||
                other.wakeUpTime == wakeUpTime) &&
            (identical(other.bedTime, bedTime) || other.bedTime == bedTime) &&
            (identical(other.isOnboardingCompleted, isOnboardingCompleted) ||
                other.isOnboardingCompleted == isOnboardingCompleted) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt) &&
            (identical(other.last7daysSynced, last7daysSynced) ||
                other.last7daysSynced == last7daysSynced));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      dateOfBirth,
      gender,
      weight,
      height,
      wakeUpTime,
      bedTime,
      isOnboardingCompleted,
      lastSyncedAt,
      last7daysSynced);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {@HiveField(0) final String? name,
      @JsonKey(fromJson: _dateTimeFromString, toJson: _dateTimeToString)
      @HiveField(1)
      final DateTime? dateOfBirth,
      @HiveField(2) final Gender? gender,
      @HiveField(3) final double? weight,
      @HiveField(4) final double? height,
      @HiveField(5)
      @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
      final TimeOfDay wakeUpTime,
      @HiveField(6)
      @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
      final TimeOfDay bedTime,
      @JsonKey(name: 'isonboardingdone', includeToJson: false)
      @HiveField(7)
      final bool isOnboardingCompleted,
      @JsonKey(includeToJson: false, includeFromJson: false)
      @HiveField(8, defaultValue: null)
      final DateTime? lastSyncedAt,
      @JsonKey(includeToJson: false, includeFromJson: false)
      @HiveField(9, defaultValue: false)
      final bool last7daysSynced}) = _$UserImpl;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @HiveField(0)
  String? get name;
  @override
  @JsonKey(fromJson: _dateTimeFromString, toJson: _dateTimeToString)
  @HiveField(1)
  DateTime? get dateOfBirth;
  @override
  @HiveField(2)
  Gender? get gender;
  @override
  @HiveField(3)
  double? get weight;
  @override
  @HiveField(4)
  double? get height;
  @override
  @HiveField(5)
  @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
  TimeOfDay get wakeUpTime;
  @override
  @HiveField(6)
  @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
  TimeOfDay get bedTime;
  @override
  @JsonKey(name: 'isonboardingdone', includeToJson: false)
  @HiveField(7)
  bool get isOnboardingCompleted;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  @HiveField(8, defaultValue: null)
  DateTime? get lastSyncedAt;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  @HiveField(9, defaultValue: false)
  bool get last7daysSynced;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
