// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/api/api_client.dart' as _i20;
import '../data/data_sources/local_data_source/food_local_data_source.dart'
    as _i5;
import '../data/data_sources/local_data_source/hydration_local_data_source.dart'
    as _i6;
import '../data/data_sources/local_data_source/reminder_local_data_source.dart'
    as _i8;
import '../data/data_sources/local_data_source/sleep_local_data_source.dart'
    as _i12;
import '../data/data_sources/local_data_source/token_local_data_source.dart'
    as _i14;
import '../data/data_sources/local_data_source/user_local_data_source.dart'
    as _i17;
import '../data/data_sources/local_data_source/weather_local_data_source.dart'
    as _i18;
import '../data/data_sources/remote_data_source/food_remote_data_source.dart'
    as _i21;
import '../data/data_sources/remote_data_source/sync_remote_data_source.dart'
    as _i26;
import '../data/data_sources/remote_data_source/tips_remote_data_source.dart'
    as _i29;
import '../data/data_sources/remote_data_source/user_remote_data_source.dart'
    as _i32;
import '../data/data_sources/remote_data_source/weather_remote_data_source.dart'
    as _i36;
import '../data/repositories/food_repository_impl.dart' as _i23;
import '../data/repositories/reminder_repository_impl.dart' as _i10;
import '../data/repositories/sync_repository_impl.dart' as _i28;
import '../data/repositories/tips_repository_imp.dart' as _i31;
import '../data/repositories/token_repository_impl.dart' as _i16;
import '../data/repositories/user_repository_impl.dart' as _i34;
import '../data/repositories/weather_repository_impl.dart' as _i38;
import '../domain/repositories/food_repository.dart' as _i22;
import '../domain/repositories/reminder_repository.dart' as _i9;
import '../domain/repositories/sync_repository.dart' as _i27;
import '../domain/repositories/tips_repository.dart' as _i30;
import '../domain/repositories/token_repository.dart' as _i15;
import '../domain/repositories/user_repository.dart' as _i33;
import '../domain/repositories/weather_repository.dart' as _i37;
import '../presentation/cubits/auth_cubit/auth_cubit.dart' as _i39;
import '../presentation/cubits/bottom_navbar_cubit/bottom_nav_bar_cubit.dart'
    as _i3;
import '../presentation/cubits/food_cubit/food_cubit.dart' as _i40;
import '../presentation/cubits/generate_otp_cubit/generate_otp_cubit.dart'
    as _i41;
import '../presentation/cubits/hydration_cubit/hydration_cubit.dart' as _i24;
import '../presentation/cubits/hydration_weekly_cubit/hydration_weekly_cubit.dart'
    as _i7;
import '../presentation/cubits/l;ast_7_days_cubit/last7_days_cubit.dart'
    as _i42;
import '../presentation/cubits/local_app_info_cubit/local_app_info_cubit.dart'
    as _i43;
import '../presentation/cubits/profile/profile_cubit/profile_cubit.dart'
    as _i44;
import '../presentation/cubits/reminder_cubit/reminders_cubit.dart' as _i11;
import '../presentation/cubits/resend_otp_cubit/resend_otp_cubit.dart' as _i45;
import '../presentation/cubits/sleep_cubit/sleep_cubit.dart' as _i25;
import '../presentation/cubits/social_login_backend_cubit/social_login_backend_cubit.dart'
    as _i46;
import '../presentation/cubits/social_login_cubit/social_login_cubit.dart'
    as _i13;
import '../presentation/cubits/sync_cubit/sync_cubit.dart' as _i47;
import '../presentation/cubits/tips_cubit/tips_cubit.dart' as _i48;
import '../presentation/cubits/verify_otp_cubit/verify_otp_cubit.dart' as _i35;
import '../presentation/cubits/weather_cubit/weather_cubit.dart' as _i49;
import '../presentation/cubits/weekly_sleep_cubit/weekly_sleep_cubit.dart'
    as _i19;
import 'di_module.dart' as _i50;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.factory<_i3.BottomNavBarCubit>(() => _i3.BottomNavBarCubit());
    gh.lazySingleton<_i4.Dio>(() => injectableModule.dio());
    gh.lazySingleton<_i5.FoodLocalDataSource>(
        () => _i5.FoodLocalDataSourceImp());
    gh.lazySingleton<_i6.HydrationLocalDataSource>(
        () => _i6.HydrationLocalDataSourceImpl());
    gh.factory<_i7.HydrationWeeklyCubit>(
        () => _i7.HydrationWeeklyCubit(gh<_i6.HydrationLocalDataSource>()));
    gh.lazySingleton<_i8.ReminderLocalDataSource>(
        () => _i8.ReminderLocalDataSourceImp());
    gh.lazySingleton<_i9.ReminderRepository>(
        () => _i10.ReminderRepositoryImpl(gh<_i8.ReminderLocalDataSource>()));
    gh.factory<_i11.RemindersCubit>(
        () => _i11.RemindersCubit(gh<_i9.ReminderRepository>()));
    gh.lazySingleton<_i12.SleepLocalDataSource>(
        () => _i12.SleepLocalDataSourceImpl());
    gh.factory<_i13.SocialLoginCubit>(() => _i13.SocialLoginCubit());
    gh.lazySingleton<_i14.TokenLocalDataSource>(
        () => _i14.TokenLocalDataSourceImpl());
    gh.lazySingleton<_i15.TokenRepository>(
        () => _i16.TokenRepositoryImpl(gh<_i14.TokenLocalDataSource>()));
    gh.lazySingleton<_i17.UserLocalDataSource>(
        () => _i17.UserLocalDataSourceImpl());
    gh.lazySingleton<_i18.WeatherLocalDataSource>(
        () => _i18.WeatherLocalDataSourceImpl());
    gh.factory<_i19.WeeklySleepCubit>(
        () => _i19.WeeklySleepCubit(gh<_i12.SleepLocalDataSource>()));
    gh.lazySingleton<_i20.ApiClient>(() => _i20.ApiClient(gh<_i4.Dio>()));
    gh.lazySingleton<_i21.FoodRemoteDataSource>(
        () => _i21.FoodRemoteDataSourceImpl(gh<_i20.ApiClient>()));
    gh.lazySingleton<_i22.FoodRepository>(() => _i23.FoodRepositoryImpl(
          gh<_i21.FoodRemoteDataSource>(),
          gh<_i5.FoodLocalDataSource>(),
        ));
    gh.factory<_i24.HydrationCubit>(
        () => _i24.HydrationCubit(gh<_i6.HydrationLocalDataSource>()));
    gh.factory<_i25.SleepCubit>(
        () => _i25.SleepCubit(gh<_i12.SleepLocalDataSource>()));
    gh.lazySingleton<_i26.SyncRemoteDataSource>(
        () => _i26.SyncRemoteDataSourceImpl(gh<_i20.ApiClient>()));
    gh.lazySingleton<_i27.SyncRepository>(() => _i28.SyncRepositoryImpl(
          gh<_i26.SyncRemoteDataSource>(),
          gh<_i6.HydrationLocalDataSource>(),
          gh<_i12.SleepLocalDataSource>(),
        ));
    gh.lazySingleton<_i29.TipsRemoteDataSource>(
        () => _i29.TipsRemoteDataSourceImpl(gh<_i20.ApiClient>()));
    gh.lazySingleton<_i30.TipsRepository>(
        () => _i31.TipsRepositoryImp(gh<_i29.TipsRemoteDataSource>()));
    gh.lazySingleton<_i32.UserRemoteDataSource>(
        () => _i32.UserRemoteDataSourceImpl(gh<_i20.ApiClient>()));
    gh.lazySingleton<_i33.UserRepository>(() => _i34.UserRepositoryImpl(
          gh<_i32.UserRemoteDataSource>(),
          gh<_i17.UserLocalDataSource>(),
          gh<_i14.TokenLocalDataSource>(),
        ));
    gh.factory<_i35.VerifyOtpCubit>(
        () => _i35.VerifyOtpCubit(gh<_i33.UserRepository>()));
    gh.lazySingleton<_i36.WeatherRemoteDataSource>(
        () => _i36.WeatherRemoteDataSourceImpl(gh<_i20.ApiClient>()));
    gh.lazySingleton<_i37.WeatherRepository>(() => _i38.WeatherRepositoryImpl(
          gh<_i36.WeatherRemoteDataSource>(),
          gh<_i18.WeatherLocalDataSource>(),
        ));
    gh.factory<_i39.AuthCubit>(() => _i39.AuthCubit(gh<_i33.UserRepository>()));
    gh.factory<_i40.FoodCubit>(() => _i40.FoodCubit(gh<_i22.FoodRepository>()));
    gh.factory<_i41.GenerateOtpCubit>(
        () => _i41.GenerateOtpCubit(gh<_i33.UserRepository>()));
    gh.factory<_i42.Last7DaysCubit>(
        () => _i42.Last7DaysCubit(gh<_i27.SyncRepository>()));
    gh.factory<_i43.LocalAppInfoCubit>(
        () => _i43.LocalAppInfoCubit(gh<_i33.UserRepository>()));
    gh.factory<_i44.ProfileCubit>(
        () => _i44.ProfileCubit(gh<_i33.UserRepository>()));
    gh.factory<_i45.ResendOtpCubit>(
        () => _i45.ResendOtpCubit(gh<_i33.UserRepository>()));
    gh.factory<_i46.SocialLoginBackendCubit>(
        () => _i46.SocialLoginBackendCubit(gh<_i33.UserRepository>()));
    gh.factory<_i47.SyncCubit>(() => _i47.SyncCubit(gh<_i27.SyncRepository>()));
    gh.factory<_i48.TipsCubit>(() => _i48.TipsCubit(gh<_i30.TipsRepository>()));
    gh.factory<_i49.WeatherCubit>(
        () => _i49.WeatherCubit(gh<_i37.WeatherRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i50.InjectableModule {}
