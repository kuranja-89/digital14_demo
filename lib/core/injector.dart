import 'dart:async';

import 'package:digital14_demo/data/datasource/event_remote_datasource.dart';
import 'package:digital14_demo/data/repositories/event_repository_impl.dart';
import 'package:digital14_demo/domain/repositories/event_repository.dart';
import 'package:digital14_demo/domain/usecases/get_event_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef AppRunner = FutureOr<void> Function();

class Injector {
  /// Initialises all app dependencies.
  ///
  /// Sentry is initialised before any dependencies are instantiated, to ensure
  /// that any potential errors can be caught as early as possible.
  ///
  /// [AppRunner] is called when everything is ready, at which point is when `runApp()`
  /// should be invoked.
  static Future<void> init({
    required AppRunner appRunner,
  }) async {
    // Sets the URL strategy for when running the app on Flutter Web
    //Routemaster.setPathUrlStrategy();

    await _initDependencies();
    appRunner();
  }

  /// Initialises all [GetIt] dependencies.
  ///
  /// Dependencies must be registered in the order that they're required by other dependencies,
  /// eg:
  /// ```markdown
  /// `AppDatabase` -> `Dao` -> `Repository`
  /// ```
  static Future<void> _initDependencies() async {
    _injectUtils();
    await _injectDatabase();
    _injectRepositories();
    _injectUseCase();

    await GetIt.I.allReady();
  }
}

/// Register utils .
///
/// Please ensure modifications are kept in alphabetical order (where possible) to ensure legibility.
void _injectUtils() {
  GetIt.I.registerSingletonAsync<SharedPreferences>(
          () => SharedPreferences.getInstance());
}

/// Register database implementations.
///
/// Please ensure modifications are kept in alphabetical order (where possible) to ensure legibility.
Future<void> _injectDatabase() async {}

/// Register all repository implementations.
///
/// Please ensure modifications are kept in alphabetical order (where possible) to ensure legibility.
void _injectRepositories() {
  GetIt.I.registerLazySingleton<EventRepository>(() => EventRepositoryImpl());
  GetIt.I.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
}

void _injectUseCase() {
  GetIt.I.registerLazySingleton<GetEventsUseCase>(() => GetEventsUseCase());
}
