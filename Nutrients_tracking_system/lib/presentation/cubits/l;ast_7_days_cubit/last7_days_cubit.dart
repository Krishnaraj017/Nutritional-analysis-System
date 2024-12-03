import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/domain/entities/app_error.dart';
import 'package:statedemo/domain/entities/enums.dart';
import 'package:statedemo/domain/repositories/sync_repository.dart';

part 'last7_days_state.dart';

@injectable
class Last7DaysCubit extends Cubit<Last7DaysState> {
  final SyncRepository _syncRepository;

  Last7DaysCubit(this._syncRepository) : super(Last7DaysInitial());

  void getLast7DaysData() async {
    emit(Last7DaysLoading());

    try {
      await _syncRepository.getLast7DaysData();
      emit(Last7DaysLoaded());
    } catch (e) {
      emit(Last7DaysError(
          AppError(errorType: ErrorType.network, message: e.toString())));
    }
  }

  void resetState() {
    emit(Last7DaysInitial());
  }
}
