import 'package:equatable/equatable.dart';
import 'package:statedemo/domain/entities/app_error.dart';
import 'package:statedemo/domain/entities/local_app_info.dart';

class LocalAppInfoState extends Equatable {
  final LocalAppInfo? localAppInfo;
  final AppError? appError;
  const LocalAppInfoState(this.localAppInfo, this.appError);
  
  @override
  List<Object?> get props => [localAppInfo, appError];
}
