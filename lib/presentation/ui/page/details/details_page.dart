import 'package:digital14_demo/data/models/event_model.dart';
import 'package:digital14_demo/presentation/bloc/geek_detail_event/details_bloc.dart';
import 'package:digital14_demo/presentation/ui/page/digital14_page.dart';
import 'package:digital14_demo/presentation/ui/view/event_details/event_details.dart';
import 'package:digital14_demo/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends Digital14Page<void> {
  static const eventIdParam = 'eventIdParam';
  static const eventModelParam = 'eventModel';
  final String eventId;
  final EventModel event;

  DetailsPage({
    required this.eventId,
    required this.event,
    String keyValue = RelativePageRoutes.details,
    String routeName = RelativePageRoutes.details,
  }) : super(
          keyValue: keyValue,
          routeName: routeName,
        );

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => BlocProvider<DetailsBloc>(
        create: (context) =>
            DetailsBloc()..add(const OnLoadDetailsGeekEvent(model: null, isFavorite: false)),
        child: EventDetails(
                event: event,
              ),
      ),
    );
  }
}
