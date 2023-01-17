import 'dart:async';

import 'package:digital14_demo/core/util/appConsts.dart';
import 'package:digital14_demo/data/models/event_model.dart';
import 'package:digital14_demo/domain/usecases/get_event_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'geek_event_event.dart';
part 'geek_event_state.dart';

class GeekEventBloc extends Bloc<GeekEventEvent, GeekEventState> {
  final _eventUseCase = GetIt.I<GetEventsUseCase>();
  final _sharedPref = GetIt.I<SharedPreferences>();

  GeekEventBloc() : super(GeekEventInitialState()) {
    on<OnLoadGeekEvent>(_onLoadEvents);
  }

  FutureOr<void> _onLoadEvents(OnLoadGeekEvent event, Emitter<GeekEventState> emit) async {
    final query = event.query;

    emit(GeekEventsLoadingState());
    final favoritesData = _sharedPref.getStringList(AppConsts.favDataStorageKey);
    final result = await _eventUseCase.execute(query: query);

    result.fold((failure) => emit(GeekEventsErrorState(failure.errorMessage)), (data) {
      for (var element in data.events) {
        element.isFavorite = favoritesData?.contains(element.id.toString()) ?? false ? true : false;
      }
      emit(GeekEventsDataOnLoadState(data, favoritesData ?? []));
    });
  }
}
