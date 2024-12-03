import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/sync_repository.dart';

part 'sync_state.dart';

@injectable
class SyncCubit extends Cubit<SyncState> {
  final SyncRepository _syncRepository;
  SyncCubit(this._syncRepository) : super(SyncInitial());

  void syncAll() async {
    emit(SyncInProgress());
    try {
      await _syncRepository.syncAll();
      emit(SyncSuccess());
    } catch (e) {
      print(e.toString());
      emit(SyncFailure());
    }
  }

  void reset() {
    emit(SyncInitial());
  }
}
