import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:clock/clock.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:statedemo/presentation/cubits/tips_cubit/tips_state.dart';
import 'package:statedemo/utils/constants/tip_constants.dart';

import '../../../domain/repositories/tips_repository.dart';

@injectable
class TipsCubit extends Cubit<TipsState> {
  final TipsRepository _tipsRepository;

  TipsCubit(this._tipsRepository) : super(const TipsLoading());

  void getTips() async {
    // directly converting it to params
    final response = await _tipsRepository
        .getTips({"date": DateFormat("dd-MM-yy").format(clock.now())});

    response.fold(
      (l) async {
        // getting a random tip form the tips stored in TipsConstants
        String tip =
            TipsConstants.tips[Random().nextInt(TipsConstants.localTipsLength)];
        emit(TipLoaded(tip));
      },
      (r) => emit(TipLoaded(r.tip)),
    );
  }
}
