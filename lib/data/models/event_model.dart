import 'package:digital14_demo/domain/entities/event_entities.dart';
import 'package:equatable/equatable.dart';

//Event Model Class
class Events extends Equatable{
  Events({
    required this.events,
  });

  List<EventModel> events;

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        events: List<EventModel>.from(json["events"].map((x) => EventModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [events];
}

class EventModel extends Equatable {
   EventModel({
    required this.id,
    required this.datetimeLocal,
    required this.shortTitle,
    required this.url,
    required this.title,
    required this.description,
    required this.performers,
    required this.venue,
    required this.isFavorite,
  });

  final int id;
  final DateTime datetimeLocal;
  final String shortTitle;
  final String url;
  final String title;
  final String description;
  final List<Performer> performers;
  final Venue venue;
  bool isFavorite;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        datetimeLocal: DateTime.parse(json["datetime_local"]),
        shortTitle: json["short_title"],
        url: json["url"],
        title: json["title"],
        description: json["description"],
        performers: List<Performer>.from(json["performers"].map((x) => Performer.fromJson(x))),
        venue: Venue.fromJson(json["venue"]),
        isFavorite: json["isFavorite"]??false
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "datetime_local": datetimeLocal.toIso8601String(),
        "short_title": shortTitle,
        "url": url,
        "title": title,
        "description": description,
        "performers": List<dynamic>.from(performers.map((x) => x.toJson())),
        "venue": venue.toJson(),
        "isFavorite": isFavorite
      };

  @override
  List<Object?> get props => [id, shortTitle, url, title, description,isFavorite];

  EventEntities toEntity() => EventEntities(
      id: id, datetimeLocal: datetimeLocal, shortTitle: shortTitle, url: url, title: title, description: description);
}

class Performer {
  Performer({
    required this.image,
  });
  String? image;

  factory Performer.fromJson(Map<String, dynamic> json) => Performer(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}

class Venue {
  Venue({
    required this.address,
  });
  String address;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
      };
}
