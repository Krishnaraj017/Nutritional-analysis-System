// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 2;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      name: fields[0] as String?,
      dateOfBirth: fields[1] as DateTime?,
      gender: fields[2] as Gender?,
      weight: fields[3] as double?,
      height: fields[4] as double?,
      wakeUpTime: fields[5] as TimeOfDay,
      bedTime: fields[6] as TimeOfDay,
      isOnboardingCompleted: fields[7] as bool,
      lastSyncedAt: fields[8] as DateTime?,
      last7daysSynced: fields[9] == null ? false : fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.dateOfBirth)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(5)
      ..write(obj.wakeUpTime)
      ..writeByte(6)
      ..write(obj.bedTime)
      ..writeByte(7)
      ..write(obj.isOnboardingCompleted)
      ..writeByte(8)
      ..write(obj.lastSyncedAt)
      ..writeByte(9)
      ..write(obj.last7daysSynced);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      name: json['name'] as String?,
      dateOfBirth: _dateTimeFromString(json['dateOfBirth'] as String?),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      weight: (json['weight'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      wakeUpTime: json['wakeUpTime'] == null
          ? const TimeOfDay(hour: 7, minute: 0)
          : _timeOfDayFromString(json['wakeUpTime'] as String),
      bedTime: json['bedTime'] == null
          ? const TimeOfDay(hour: 22, minute: 0)
          : _timeOfDayFromString(json['bedTime'] as String),
      isOnboardingCompleted: json['isonboardingdone'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dateOfBirth': _dateTimeToString(instance.dateOfBirth),
      'gender': _$GenderEnumMap[instance.gender],
      'weight': instance.weight,
      'height': instance.height,
      'wakeUpTime': _timeOfDayToString(instance.wakeUpTime),
      'bedTime': _timeOfDayToString(instance.bedTime),
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
