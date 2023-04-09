// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;
import 'package:sqflite/sqflite.dart' as _i3;

import 'domain/notes/i_note_repository.dart' as _i7;
import 'infrastructure/core/injectable_module.dart' as _i10;
import 'infrastructure/notes/datasources/i_note_datasource.dart' as _i4;
import 'infrastructure/notes/datasources/note_local_datasource.dart' as _i5;
import 'infrastructure/notes/repositoryes/location_repository.dart' as _i8;

const String _dev = 'dev';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  await gh.factoryAsync<_i3.Database>(
    () => injectableModule.database,
    preResolve: true,
  );
  gh.lazySingleton<_i4.INoteLocalDatasource>(
    () => _i5.SqfliteNoteLocalDatasource(
        database: get<_i6.Future<_i3.Database>>()),
    registerFor: {
      _dev,
      _test,
    },
  );
  gh.lazySingleton<_i7.INoteRepository>(() =>
      _i8.NoteRepository(NoteLocalDataSource: get<_i4.INoteLocalDatasource>()));
  await gh.factoryAsync<_i9.SharedPreferences>(
    () => injectableModule.prefs,
    preResolve: true,
  );
  return get;
}

class _$InjectableModule extends _i10.InjectableModule {}
