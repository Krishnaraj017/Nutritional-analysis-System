import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:statedemo/data/constants/hive_constants.dart';

part 'local_app_info.freezed.dart';
part 'local_app_info.g.dart';

@freezed
@HiveType(typeId: HiveConstants.localInfoType)
class LocalAppInfo with _$LocalAppInfo {
  const factory LocalAppInfo({
    @HiveField(0,defaultValue: false)
    @Default(false) bool hisVisited,
  }) =_LocalAppInfo;
}
