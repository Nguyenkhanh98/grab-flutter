// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_application_1/APIs/driver.api.dart' as _i9;
import 'package:flutter_application_1/APIs/instance.api.dart' as _i4;
import 'package:flutter_application_1/common/platform/connectivity.dart' as _i3;
import 'package:flutter_application_1/infrastructure/data_sources/local/ride.local_data_provider.dart'
    as _i5;
import 'package:flutter_application_1/infrastructure/data_sources/local/user.local_data_provider.dart'
    as _i7;
import 'package:flutter_application_1/infrastructure/data_sources/remote/driver.rdp.dart'
    as _i10;
import 'package:flutter_application_1/infrastructure/data_sources/remote/ride.remote_data_provider.dart'
    as _i6;
import 'package:flutter_application_1/infrastructure/data_sources/remote/user.remote_data_provider.dart'
    as _i8;
import 'package:flutter_application_1/infrastructure/repositories/driver.repository.dart'
    as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
    gh.factory<_i3.Connectivity>(() => _i3.Connectivity());
    gh.factory<_i4.GrabAPIInstance>(() => _i4.GrabAPIInstance());
    gh.factory<_i5.RideLocalDataProvider>(() => _i5.RideLocalDataProvider());
    gh.factory<_i6.RideRemoteDataProvider>(() => _i6.RideRemoteDataProvider());
    gh.factory<_i7.UserLocalDataProvider>(() => _i7.UserLocalDataProvider());
    gh.factory<_i8.UserRemoteDataProvider>(() => _i8.UserRemoteDataProvider());
    gh.factory<_i9.DriverApi>(() => _i9.DriverApi(gh<_i4.GrabAPIInstance>()));
    gh.factory<_i10.DriverRemoteDataProvider>(
        () => _i10.DriverRemoteDataProvider(gh<_i9.DriverApi>()));
    gh.factory<_i11.DriverRepository>(() => _i11.DriverRepository(
          connectivity: gh<_i3.Connectivity>(),
          driverRemoteDataProvider: gh<_i10.DriverRemoteDataProvider>(),
        ));
    return this;
  }
}
