import 'package:equatable/equatable.dart';

abstract class TipsState extends Equatable {
  const TipsState();
}

class TipLoaded extends TipsState {
  final String remoteTip;
  const TipLoaded(this.remoteTip);

  @override
  List<Object?> get props => [remoteTip];
}

class TipsLoading extends TipsState {
  const TipsLoading();
  @override
  List<Object?> get props => [];
}
