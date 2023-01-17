import 'package:digital14_demo/presentation/bloc/geek_list_event/geek_event_bloc.dart';
import 'package:digital14_demo/presentation/ui/page/digital14_page.dart';
import 'package:digital14_demo/presentation/ui/view/list/event_list_view.dart';
import 'package:digital14_demo/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventListPage extends Digital14Page<void> {
  EventListPage({
    String keyValue = InitialPageRoutes.listPage,
    String routeName = InitialPageRoutes.listPage,
    Map<String, dynamic> arguments = const <String, dynamic>{},
  }) : super(
          keyValue: keyValue,
          routeName: routeName,
          arguments: arguments,
        );

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => BlocProvider<GeekEventBloc>(
        create: (context) => GeekEventBloc()..add(const OnLoadGeekEvent(),),
        child: const EventListView(),
      ),
    );
  }
}
