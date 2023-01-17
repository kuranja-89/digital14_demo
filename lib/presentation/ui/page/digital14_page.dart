import 'package:flutter/material.dart';

/// An abstraction around Material [Page] to enforce required
/// arguments within the app.
abstract class Digital14Page<T> extends Page<T> {
  /// Defines the [ValueKey] value for the given [Page].
  ///
  /// Should be unique to the current [Digital14Page] as it
  /// is used to check equality of pages within the stack when replacing
  /// routes with the same `keyValue`.
  final String keyValue;

  /// Defines the route name for the current [Digital14Page].
  ///
  /// While not required for routing mechanisms, the `routeName` is used
  /// within registered [RouteObserver]s for analytics, debugging and
  /// capturing user events.
  final String routeName;

  /// Creates a [Digital14Page].
  ///
  /// This should be used over [Page] to ensure a `keyValue`
  /// and `routeName` value is provided.
  Digital14Page({
    required this.keyValue,
    required this.routeName,
    Object? arguments,
  }) : super(
          key: ValueKey(keyValue),
          name: routeName,
          arguments: arguments,
        );
}
