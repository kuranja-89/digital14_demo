part of 'geek_event_bloc.dart';

abstract class GeekEventState extends Equatable {
  const GeekEventState();
  @override
  List<Object?> get props => [];
}

class GeekEventInitialState extends GeekEventState {}

class GeekEventsLoadingState extends GeekEventState {}

class GeekEventsErrorState extends GeekEventState {
  final String message;

  const GeekEventsErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class GeekEventsDataOnLoadState extends GeekEventState {
  final Events events;
  final List<String> favourites;

  const GeekEventsDataOnLoadState(this.events, this.favourites);

  @override
  List<Object?> get props => [events];
}
