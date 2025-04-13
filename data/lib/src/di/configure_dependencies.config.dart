// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/src/remote/api/base/api_http_client.dart' as _i603;
import 'package:data/src/remote/api/base/header_helper.dart' as _i867;
import 'package:data/src/remote/api/geocoding_api.dart' as _i341;
import 'package:data/src/repository/config_repository.dart' as _i850;
import 'package:data/src/repository/log_repository.dart' as _i95;
import 'package:data/src/repository/map_repository.dart' as _i633;
import 'package:domain/domain.dart' as _i494;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt $initDataGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i341.GeocodingApi>(() => _i341.GeocodingApi());
    gh.lazySingleton<_i867.HeaderHelper>(() => _i867.HeaderHelper());
    gh.lazySingleton<_i603.ApiHttpClient>(() => _i603.ApiHttpClient());
    gh.lazySingleton<_i494.ConfigRepository>(() => _i850.ConfigRepository());
    gh.lazySingleton<_i494.LogRepository>(() => _i95.LogRepository());
    gh.lazySingleton<_i494.MapRepository>(() => _i633.ConfigRepository());
    return this;
  }
}
