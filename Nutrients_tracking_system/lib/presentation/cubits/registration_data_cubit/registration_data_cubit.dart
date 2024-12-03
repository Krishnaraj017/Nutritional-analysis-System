import 'package:bloc/bloc.dart';
import 'package:statedemo/data/models/user.dart';
import 'package:statedemo/domain/entities/enums.dart';

const double _defaultWeight = 60;
const double _defaultHeight = 170;
const Gender _defaultGender = Gender.male;
DateTime _defaultDateOfBirth = DateTime(1990, 1, 1);

class RegistrationDataCubit extends Cubit<User> {
  RegistrationDataCubit(User user)
      : super(
          user.copyWith(
            weight: _defaultWeight,
            gender: _defaultGender,
            height: _defaultHeight,
            dateOfBirth: _defaultDateOfBirth,
          ),
        );

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updateDateOfBirth(DateTime dateOfBirth) {
    emit(state.copyWith(dateOfBirth: dateOfBirth));
  }

  void updateGender(Gender gender) {
    emit(state.copyWith(gender: gender));
  }

  void updateWeight(double weight) {
    emit(state.copyWith(weight: weight));
  }

  void updateHeight(double height) {
    emit(state.copyWith(height: height));
  }
}
