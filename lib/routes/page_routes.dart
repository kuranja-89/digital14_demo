import 'dart:convert';

import 'package:digital14_demo/data/models/event_model.dart';
import 'package:digital14_demo/presentation/ui/page/details/details_page.dart';
import 'package:routemaster/routemaster.dart';

import '../presentation/ui/page/list/event_list_page.dart';

/// Defines the base routing paths within the app.
///
/// Should generally be limited to the root pages of each [RouteMap].
class InitialPageRoutes {
  static const root = '/';
  static const listPage = '/listPage';
}

/// Defines the available page route names.
///
/// Valid paths should be declared within the relevant [PageRoutes] value.
/// When [RouteMaster.push] is invoked with a [RelativePageRoute], it
/// will be treated as a relative path to the current path, and push the
/// page on top.
///
/// Pushing a page with a leading `/` implies an absolute path, so this
/// will replace the current navigation stack with the new route path.
///
/// See [RouteMaster.push] for more information.
class RelativePageRoutes {
  static const details = 'event_details';
}

class PageRoutes {
  /// Defines the primary routing map for a logged-in user.
  static final rootRoute = RouteMap(
    routes: {
      InitialPageRoutes.root: (routeData) => EventListPage(),

      // `/sessionOverview/:sessionId`
      '/${RelativePageRoutes.details}/:${DetailsPage.eventIdParam}': (routeData) {
        final eventId = _parseStringParam(routeData.pathParameters, DetailsPage.eventIdParam);
        final eventModel = EventModel.fromJson(
            jsonDecode(_parseStringParam(routeData.queryParameters, DetailsPage.eventModelParam) ?? ""));
        if (eventId != null) {
          return DetailsPage(
            eventId: eventId,
            keyValue: routeData.path,
            routeName: routeData.path,
            event: eventModel,
          );
        } else {
          // ? Redirect if path param null/empty
          return const Redirect(InitialPageRoutes.root);
        }
      },
    },
  );

  static String? _parseStringParam(Map<String, String> params, String paramName) {
    final value = params[paramName];
    if (value != null && value.isNotEmpty) {
      return value;
    }
    return null;
  }
}
