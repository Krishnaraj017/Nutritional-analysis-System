import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/data/models/weather_response.dart';
import 'package:statedemo/domain/entities/app_error.dart';
import 'package:statedemo/domain/entities/params/get_weather_params.dart';

import '../../../domain/repositories/weather_repository.dart';

part 'weather_state.dart';

@injectable
class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  void getWeather({required String city}) async {
    emit(WeatherLoading());
    final weatherEither = await _weatherRepository
        .getWeather(GetWeatherParams(query: city).toJson());
    weatherEither.fold(
      (l) => emit(WeatherError(l)),
      (r) => emit(WeatherLoaded(r)),
    );
  }
}
