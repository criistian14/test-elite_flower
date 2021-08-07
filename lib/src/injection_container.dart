import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/http/connection.dart';
import 'core/utils/network_info.dart';
import 'features/countries/data/datasources/local/country_local_data_source.dart';
import 'features/countries/data/datasources/remote/country_remote_data_source.dart';
import 'features/countries/data/models/country_model.dart';
import 'features/countries/data/models/currency_model.dart';
import 'features/countries/data/models/language_model.dart';
import 'features/countries/data/models/regional_bloc_model.dart';
import 'features/countries/data/models/translations_model.dart';
import 'features/countries/data/repositories/country_repository_impl.dart';
import 'features/countries/domain/entities/country.dart';
import 'features/countries/domain/repositories/country_repository.dart';
import 'features/countries/domain/usecases/get_country.dart';
import 'features/countries/domain/usecases/save_country.dart';
import 'features/users/data/datasources/local/language_local_data_source.dart';
import 'features/users/data/datasources/local/theme_local_data_source.dart';
import 'features/users/data/models/config_local_model.dart';
import 'features/users/data/repositories/language_repository_impl.dart';
import 'features/users/data/repositories/theme_repository_impl.dart';
import 'features/users/domain/entities/config_local.dart';
import 'features/users/domain/repositories/language_repository.dart';
import 'features/users/domain/repositories/theme_repository.dart';
import 'features/users/domain/usecases/get_language.dart';
import 'features/users/domain/usecases/get_theme.dart';
import 'features/users/domain/usecases/set_language.dart';
import 'features/users/domain/usecases/set_theme.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  _initUseCases();
  _initRepositories();
  _initDataSources();

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<Dio>(() => getHttpClient());

  //! External
  await Hive.initFlutter();
  Hive.registerAdapter(CurrencyModelAdapter());
  Hive.registerAdapter(LanguageModelAdapter());
  Hive.registerAdapter(TranslationsModelAdapter());
  Hive.registerAdapter(RegionalBlocModelAdapter());

  Hive.registerAdapter(CountryModelAdapter());
  await Hive.openBox<Country>("countries");

  Hive.registerAdapter(ConfigLocalModelAdapter());
  await Hive.openBox<ConfigLocal>("config");

  sl.registerLazySingleton<HiveInterface>(
    () => Hive,
  );
  sl.registerLazySingleton<Connectivity>(
    () => Connectivity(),
  );
}

void _initUseCases() {
  // * Country
  sl.registerLazySingleton(
    () => GetCountry(repository: sl()),
  );
  sl.registerLazySingleton(
    () => SaveCountry(repository: sl()),
  );

  // * Theme
  sl.registerLazySingleton(
    () => GetTheme(repository: sl()),
  );
  sl.registerLazySingleton(
    () => SetTheme(repository: sl()),
  );

  // * Language
  sl.registerLazySingleton(
    () => GetLanguage(repository: sl()),
  );
  sl.registerLazySingleton(
    () => SetLanguage(repository: sl()),
  );
}

void _initRepositories() {
  // * Country
  sl.registerLazySingleton<CountryRepository>(
    () => CountryRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  // * Theme
  sl.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  // * Language
  sl.registerLazySingleton<LanguageRepository>(
    () => LanguageRepositoryImpl(
      localDataSource: sl(),
    ),
  );
}

void _initDataSources() {
  // * Country
  sl.registerLazySingleton<CountryLocalDataSource>(
    () => CountryLocalDataSourceImpl(
      hive: sl(),
    ),
  );
  sl.registerLazySingleton<CountryRemoteDataSource>(
    () => CountryRemoteDataSourceImpl(
      clientHttp: sl(),
    ),
  );

  // * Theme
  sl.registerLazySingleton<ThemeLocalDataSource>(
    () => ThemeLocalDataSourceImpl(
      hive: sl(),
    ),
  );

  // * Language
  sl.registerLazySingleton<LanguageLocalDataSource>(
    () => LanguageLocalDataSourceImpl(
      hive: sl(),
    ),
  );
}
