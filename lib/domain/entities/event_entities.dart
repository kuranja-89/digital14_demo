import 'package:equatable/equatable.dart';

class EventEntities extends Equatable {
  const EventEntities({
    required this.id,
    required this.datetimeLocal,
    required this.shortTitle,
    required this.url,
    required this.title,
    required this.description,
  });

  final int id;
  final DateTime datetimeLocal;
  final String shortTitle;
  final String url;
  final String title;
  final String description;

  @override
  List<Object?> get props => [id, shortTitle, url, title, description];
}
