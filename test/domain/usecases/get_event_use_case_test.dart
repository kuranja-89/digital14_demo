import 'package:dartz/dartz.dart';
import 'package:digital14_demo/data/failure.dart';
import 'package:digital14_demo/domain/repositories/event_repository.dart';
import 'package:digital14_demo/domain/usecases/get_event_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/events_fixtures.dart';

class _MockEventRepository extends Mock implements EventRepository {}

void main() {
  late _MockEventRepository mockEventRepository;

  setUp(() {
    mockEventRepository = _MockEventRepository();

    GetIt.I.registerSingleton<EventRepository>(mockEventRepository);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  group('Response From useCase', () {
    test('success', () async {
      when(() => mockEventRepository.getEvents('')).thenAnswer((_) => Future.value(Right(EventFixtures().events)));
      final result = await GetEventsUseCase().execute(query: '');
      expect(result, Right(EventFixtures().events));
    });
    test('Connection Failure', () async {
      when(() => mockEventRepository.getEvents(''))
          .thenAnswer((_) => Future.value(const Left(ConnectionFailure('connection failure'))));
      final result = await GetEventsUseCase().execute(query: '');
      expect(result, const Left(ConnectionFailure('connection failure')));
    });
    test('Server Failure', () async {
      when(() => mockEventRepository.getEvents(''))
          .thenAnswer((_) => Future.value(const Left(ServerFailure('server failure'))));
      final result = await GetEventsUseCase().execute(query: '');
      expect(result, const Left(ServerFailure('server failure')));
    });
  });
}
