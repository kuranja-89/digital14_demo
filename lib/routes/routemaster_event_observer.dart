import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:routemaster/routemaster.dart';

/// Observes all routing interactions
class RouteMasterEventObserver extends RoutemasterObserver with UiLoggy {
  @override
  void didPush(Route route, Route? previousRoute) {
    loggy.info('Pushed ${route.settings.name}');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    loggy.info('Popped ${route.settings.name}');
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    loggy.info('Replaced ${oldRoute?.settings.name} with ${newRoute?.settings.name}');

    super.didReplace(oldRoute: oldRoute, newRoute: newRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    loggy.info('Removed ${previousRoute?.settings.name}, back to ${route.settings.name}');
    super.didRemove(route, previousRoute);
  }
}
