part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object?> get props => [];
}

class OnLoadDetailsGeekEvent extends DetailsEvent {
  final EventModel? model;
  final bool isFavorite;
  const OnLoadDetailsGeekEvent({this.model, required this.isFavorite});
  @override
  List<Object?> get props => [model];
}

class FavoriteButtonPressedEvent extends DetailsEvent {
  final EventModel model;
  const FavoriteButtonPressedEvent({required this.model});

  @override
  List<Object?> get props => [model];
}