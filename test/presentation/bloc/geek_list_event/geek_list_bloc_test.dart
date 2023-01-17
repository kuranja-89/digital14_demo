import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:digital14_demo/data/failure.dart';
import 'package:digital14_demo/domain/usecases/get_event_use_case.dart';
import 'package:digital14_demo/presentation/bloc/geek_list_event/geek_event_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/events_fixtures.dart';

class _MockGetEventsUseCase extends Mock implements GetEventsUseCase {}

class _MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late _MockGetEventsUseCase mockGetEventsUseCase;
  late _MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockGetEventsUseCase = _MockGetEventsUseCase();
    mockSharedPreferences = _MockSharedPreferences();
    GetIt.I.registerSingleton<GetEventsUseCase>(mockGetEventsUseCase);
    GetIt.I.registerSingleton<SharedPreferences>(mockSharedPreferences);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  group('event List Bloc test case', () {
    blocTest<GeekEventBloc, GeekEventState>('GeekEventsDataOnLoadState test case',
        setUp: () {
          when(() => mockGetEventsUseCase.execute()).thenAnswer((_) => Future.value(Right(EventFixtures().events)));
        },
        build: () => GeekEventBloc(),
        act: (bloc) {
          bloc.add(const OnLoadGeekEvent());
        },
        verify: (bloc) {
          expect(bloc.state, GeekEventsDataOnLoadState(EventFixtures().events, const []));
        });

    blocTest<GeekEventBloc, GeekEventState>('GeekEventsErrorState test case',
        setUp: () {
          when(() => mockGetEventsUseCase.execute())
              .thenAnswer((_) => Future.value(const Left(ServerFailure('Server failed'))));
        },
        build: () => GeekEventBloc(),
        act: (bloc) {
          bloc.add(const OnLoadGeekEvent());
        },
        verify: (bloc) {
          expect(bloc.state, const GeekEventsErrorState('Server failed'));
        });
  });
}
