part of 'sync_cubit.dart';

abstract class SyncState extends Equatable {
  const SyncState();
}

class SyncInitial extends SyncState {
  @override
  List<Object> get props => [];
}

class SyncInProgress extends SyncState {
  @override
  List<Object> get props => [];
}

class SyncFailure extends SyncState {
  @override
  List<Object> get props => [];
}

class SyncSuccess extends SyncState {
  @override
  List<Object> get props => [];
}
