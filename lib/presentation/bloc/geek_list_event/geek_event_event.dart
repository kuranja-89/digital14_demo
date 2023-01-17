part of 'geek_event_bloc.dart';

abstract class GeekEventEvent extends Equatable {
  const GeekEventEvent();

  @override
  List<Object?> get props => [];
}

class OnLoadGeekEvent extends GeekEventEvent {
  final String? query;
  const OnLoadGeekEvent({this.query});
  @override
  List<Object?> get props => [query];
}
