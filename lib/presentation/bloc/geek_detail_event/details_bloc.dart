import 'dart:async';
import 'package:digital14_demo/core/util/appConsts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digital14_demo/data/models/event_model.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'details_event.dart';

part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final _sharedPref = GetIt.I<SharedPreferences>();

  DetailsBloc() : super(DetailsInitialState()) {
    on<OnLoadDetailsGeekEvent>(_onLoadEvents);
    on<FavoriteButtonPressedEvent>(_onFavBtnEvent);
  }

  FutureOr<void> _onLoadEvents(
      OnLoadDetailsGeekEvent event, Emitter<DetailsState> emit) {
  }

  FutureOr<void> _onFavBtnEvent(
      FavoriteButtonPressedEvent event, Emitter<DetailsState> emit) {
    var favoritesData = _sharedPref.getStringList(AppConsts.favDataStorageKey);

    if (favoritesData != null &&
        favoritesData.contains(event.model.id.toString())) {
      favoritesData.remove(event.model.id.toString());
    } else {
      favoritesData ??= [];
      favoritesData.add(event.model.id.toString());
    }

    _sharedPref.setStringList(AppConsts.favDataStorageKey, favoritesData);
  }
}
