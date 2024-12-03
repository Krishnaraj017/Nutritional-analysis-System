import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:statedemo/data/models/hydration.dart';

import '../../../data/models/sleep.dart';

part 'sync_params.freezed.dart';
part 'sync_params.g.dart';

@Freezed()
class SyncParams with _$SyncParams {
  const factory SyncParams({
    required List<Hydration> hydration,
    required List<Sleep> sleep,
  }) = _SyncParams;

  factory SyncParams.fromJson(Map<String, dynamic> json) =>
      _$SyncParamsFromJson(json);
}
