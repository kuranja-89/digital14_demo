import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:digital14_demo/data/models/event_model.dart';
import 'package:digital14_demo/domain/usecases/get_event_use_case.dart';
import 'package:digital14_demo/presentation/bloc/geek_list_event/geek_event_bloc.dart';
import 'package:digital14_demo/presentation/ui/view/list/event_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockGeekEventBloc extends MockBloc<GeekEventEvent, GeekEventState> implements GeekEventBloc {}

class _MockGetEventsUseCase extends Mock implements GetEventsUseCase {}

class _MockSharedPreference extends Mock implements SharedPreferences {}

void main() {
  late _MockGeekEventBloc mockGeekEventBloc;
  late _MockGetEventsUseCase mockEventsUseCase;
  late _MockSharedPreference mockSharedPreference;
  setUp(() {
    mockGeekEventBloc = _MockGeekEventBloc();
    mockEventsUseCase = _MockGetEventsUseCase();
    mockSharedPreference = _MockSharedPreference();
    GetIt.I.registerLazySingleton<GetEventsUseCase>(() => mockEventsUseCase);
    GetIt.I.registerLazySingleton<SharedPreferences>(() => mockSharedPreference);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  group('', () {
    group('', () {
      setUp(() {
        whenListen(
            mockGeekEventBloc,
            Stream.value(
              GeekEventsDataOnLoadState(Events(events: const []), const []),
            ),
            initialState: GeekEventInitialState());

        when(() => mockEventsUseCase.execute()).thenAnswer((_) async => Future.value(Right(Events(events: []))));
      });

      testWidgets('', (widgetTester) async {
        await widgetTester.pumpWidget(_WidgetWrapper(
          geekEventBloc: mockGeekEventBloc,
        ));
        await widgetTester.pumpAndSettle();

        expect(find.byKey(const Key('ListViewKey')), findsOneWidget);
        expect(find.byKey(const Key('ListViewAppBarKey')), findsOneWidget);
      });
    });
  });
}

class _WidgetWrapper extends StatelessWidget {
  final GeekEventBloc geekEventBloc;

  const _WidgetWrapper({
    Key? key,
    required this.geekEventBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<GeekEventBloc>(
          create: (context) => GeekEventBloc()
            ..add(
              const OnLoadGeekEvent(),
            ),
          child: const EventListView()),
    );
  }
}
