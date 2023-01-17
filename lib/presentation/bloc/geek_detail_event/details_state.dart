part of 'details_bloc.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();
  @override
  List<Object?> get props => [];
}

class DetailsInitialState extends DetailsState {
}

class DetailsOnLoadState extends DetailsState {
  final EventModel? model;
  final bool isFavorite;
  const DetailsOnLoadState({required this.isFavorite,required this.model});
  @override
  List<Object?> get props => [model,isFavorite];
}
