import 'package:bloc_test/bloc_test.dart';
import 'package:digital14_demo/presentation/bloc/geek_detail_event/details_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late _MockSharedPreferences mockSharedPreferences;

  tearDown(() {
    GetIt.I.reset();
  });

  setUp(() {
    mockSharedPreferences = _MockSharedPreferences();
    GetIt.I.registerSingleton<SharedPreferences>(mockSharedPreferences);
  });
  group('Details block test case', () {
    blocTest<DetailsBloc, DetailsState>('OnLoadDetailsGeekEvent test case',
        build: () => DetailsBloc(),
        act: (bloc) {
          bloc.add(const OnLoadDetailsGeekEvent(isFavorite: false));
        },
        verify: (bloc) {
          expect(bloc.state, DetailsInitialState());
        });
  });
}
