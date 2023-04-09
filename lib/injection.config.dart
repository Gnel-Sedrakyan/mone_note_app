// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;
import 'package:sqflite/sqflite.dart' as _i3;

import 'application/locale_store.dart' as _i8;
import 'application/notes_store.dart' as _i9;
import 'domain/notes/i_note_repository.dart' as _i6;
import 'infrastructure/core/injectable_module.dart' as _i11;
import 'infrastructure/notes/datasources/i_note_datasource.dart' as _i4;
import 'infrastructure/notes/datasources/note_local_datasource.dart' as _i5;
import 'infrastructure/notes/repositoryes/note_repository.dart' as _i7;

const String _dev = 'dev';
const String _test = 'test';
const String _prod = 'prod';
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
    () => _i5.SqfliteNoteLocalDatasource(database: get<_i3.Database>()),
    registerFor: {
      _dev,
      _test,
      _prod,
    },
  );
  gh.lazySingleton<_i6.INoteRepository>(() =>
      _i7.NoteRepository(noteLocalDataSource: get<_i4.INoteLocalDatasource>()));
  gh.lazySingleton<_i8.LocaleStore>(() => _i8.LocaleStoreImpl());
  gh.lazySingleton<_i9.NotesStore>(
      () => _i9.NotesStoreImpl(get<_i6.INoteRepository>()));
  await gh.factoryAsync<_i10.SharedPreferences>(
    () => injectableModule.prefs,
    preResolve: true,
  );
  return get;
}

class _$InjectableModule extends _i11.InjectableModule {}
