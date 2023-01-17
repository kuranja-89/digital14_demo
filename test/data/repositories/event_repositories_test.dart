import 'package:dartz/dartz.dart';
import 'package:digital14_demo/data/datasource/event_remote_datasource.dart';
import 'package:digital14_demo/data/repositories/event_repository_impl.dart';
import 'package:digital14_demo/domain/repositories/event_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/events_fixtures.dart';

class _MockRemoteDataSource extends Mock implements RemoteDataSource {}

class _MockEventRepository extends Mock implements EventRepository {}

void main() {
  late _MockRemoteDataSource mockRemoteDataSource;
  late _MockEventRepository mockEventRepository;

  setUp(() {
    mockRemoteDataSource = _MockRemoteDataSource();
    mockEventRepository = _MockEventRepository();
    GetIt.I.registerSingleton<RemoteDataSource>(mockRemoteDataSource);
    GetIt.I.registerSingleton<EventRepository>(mockEventRepository);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  group('Repo response test case', () {
    setUp(() {
      when(() => mockRemoteDataSource.getEvents('')).thenAnswer((_) => Future.value(EventFixtures().events));
    });

    test('success', () async {
      final result = await EventRepositoryImpl().getEvents('');
      expect(result, Right(EventFixtures().events));
    });
  });
}
