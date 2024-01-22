// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repository/employee_repository_impl.dart' as _i5;
import '../domain/repository/employee_repository.dart' as _i4;
import '../presentation/details/bloc/details_bloc.dart' as _i8;
import '../presentation/details/date_time/bloc/date_time_bloc.dart' as _i3;
import '../presentation/details/date_time/bloc/quick_tiles_bloc.dart' as _i7;
import '../presentation/home/bloc/home_bloc.dart' as _i6;

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
    gh.factory<_i3.DateTimeBloc>(() => _i3.DateTimeBloc());
    gh.singleton<_i4.EmployeeRepository>(_i5.EmployeeRepositoryImpl());
    gh.factory<_i6.HomeBloc>(() => _i6.HomeBloc(gh<_i4.EmployeeRepository>()));
    gh.factory<_i7.QuickTilesBloc>(() => _i7.QuickTilesBloc());
    gh.factory<_i8.DetailsBloc>(
        () => _i8.DetailsBloc(gh<_i4.EmployeeRepository>()));
    return this;
  }
}
