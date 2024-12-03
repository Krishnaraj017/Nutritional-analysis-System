import 'package:clock/clock.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:statedemo/domain/entities/enums.dart';

part 'hydration.freezed.dart';
part 'hydration.g.dart';

String _intToString(int value) {
  return value.toString();
}

int _stringToInt(String value) {
  return int.parse(value);
}

@Freezed()
@Collection(ignore: {'copyWith'})
class Hydration with _$Hydration {
  const factory Hydration({
    @Index(unique: true, replace: true) required DateTime date,
    @JsonKey(toJson: _intToString, fromJson: _stringToInt) required int target,
    @JsonKey(name: 'updationTime') DateTime? cloudUpdatedAt,
    @JsonKey(includeToJson: false) required DateTime localUpdatedAt,
    @Default(HydrationLog()) HydrationLog log,
  }) = _Hydration;

  const Hydration._();

  Id get id => date.millisecondsSinceEpoch;

  @ignore
  String get ratioString => '${log.total} ml / $target ml';

  @ignore
  double get ratio => log.total / target;

  @ignore
  double rationBasedOnTimeOfDay(TimeOfDayEnum timeOfDayEnum) {
    final ratio = log.hydrationLevelBasedOnTimeOfDay(timeOfDayEnum) / target;
    return ratio.isNaN ? 0 : ratio;
  }

  factory Hydration.fromJson(Map<String, dynamic> json) =>
      _$HydrationFromJson(json);

  factory Hydration.fromServer(Map<String, dynamic> json) {
    Map<String, dynamic> plainJson = {};
    plainJson.addAll(json);
    plainJson['localUpdatedAt'] = clock.now().toIso8601String();
    return Hydration.fromJson(plainJson);
  }
}

@freezed
@Embedded(ignore: {'copyWith'})
class HydrationLog with _$HydrationLog {
  const factory HydrationLog({
    @JsonKey(toJson: _intToString, fromJson: _stringToInt) @Default(0) int mor,
    @JsonKey(toJson: _intToString, fromJson: _stringToInt) @Default(0) int aft,
    @JsonKey(toJson: _intToString, fromJson: _stringToInt) @Default(0) int eve,
    @JsonKey(toJson: _intToString, fromJson: _stringToInt) @Default(0) int nig,
  }) = _HydrationLog;

  const HydrationLog._();

  @ignore
  int get total => mor + aft + eve + nig;

  @ignore
  int hydrationLevelBasedOnTimeOfDay(TimeOfDayEnum timeOfDayEnum) {
    return switch (timeOfDayEnum) {
      TimeOfDayEnum.morning => mor,
      TimeOfDayEnum.afternoon => aft,
      TimeOfDayEnum.evening => eve,
      TimeOfDayEnum.night => nig,
    };
  }

  factory HydrationLog.fromJson(Map<String, dynamic> json) =>
      _$HydrationLogFromJson(json);
}
