import 'package:hive/hive.dart';
import 'package:statedemo/data/constants/hive_constants.dart';

part 'enums.g.dart';

@HiveType(typeId: HiveConstants.genderEnumType)
enum Gender {
  @HiveField(0)
  male,
  @HiveField(1)
  female;

  @override
  String toString() {
    return switch (this) {
      Gender.male => 'Male',
      Gender.female => 'Female',
    };
  }
}

enum ErrorType {
  network,
  api,
  timeout,
  unknown,
  cache,
  tokenExpired,
  incorrectOtp,
  hiveError,
  hiveTypeError,
}

enum HeightUnit {
  cm,
  ft;

  @override
  String toString() {
    return this == HeightUnit.cm ? 'cm' : 'ft';
  }

  double get conversionFactor {
    return this == HeightUnit.cm ? 1 : 0.0328084;
  }
}

enum WeightUnit {
  kg,
  lb;

  @override
  String toString() {
    return this == WeightUnit.kg ? 'kg' : 'lb';
  }

  double get conversionFactor {
    return this == WeightUnit.kg ? 1 : 2.20462;
  }
}

enum TimeOfDayEnum {
  morning,
  afternoon,
  evening,
  night;

  String get greeting {
    switch (this) {
      case TimeOfDayEnum.morning:
        return 'Good Morning,';
      case TimeOfDayEnum.afternoon:
        return 'Good Afternoon,';
      case TimeOfDayEnum.evening:
        return 'Good Evening,';
      case TimeOfDayEnum.night:
        return 'Good Evening,';
    }
  }

  @override
  String toString() {
    switch (this) {
      case TimeOfDayEnum.morning:
        return 'Morning';
      case TimeOfDayEnum.afternoon:
        return 'Afternoon';
      case TimeOfDayEnum.evening:
        return 'Evening';
      case TimeOfDayEnum.night:
        return 'Night';
    }
  }
}

enum MealType {
  breakfast,
  lunch,
  dinner;

  @override
  String toString() {
    switch (this) {
      case MealType.breakfast:
        return 'Breakfast';
      case MealType.lunch:
        return 'Lunch';
      case MealType.dinner:
        return 'Dinner';
        default:
        throw MealType.breakfast;
    }
  }
}


