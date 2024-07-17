import 'package:flutter/widgets.dart';

class NavigatorExtension {
  NavigatorExtension._();

  /// Clears the current navigator stack and pushes a new route.
  ///
  /// The [context] parameter is the build context of the current widget.
  /// The [newRoute] parameter is the new route to be pushed onto the navigator stack.
  ///
  /// Returns a `Future<T?>` that completes with the result of the new route.
  static Future<T?> clear<T extends Object?>(
    BuildContext context,
    Route<T> newRoute,
  ) =>
      Navigator.pushAndRemoveUntil(
        context,
        newRoute,
        (_) => false,
      );

  /// Clears the current navigator stack and pushes a new route.
  ///
  /// The [context] parameter is the build context of the current widget.
  /// The [routeName] parameter is the name of the new route to be pushed onto the navigator stack.
  /// The [arguments] parameter is an optional object to be passed to the new route.
  ///
  /// Returns a `Future<T?>` that completes with the result of the new route.
  static Future<T?> clearNamed<T extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) =>
      Navigator.pushNamedAndRemoveUntil(
        context,
        routeName,
        arguments: arguments,
        (_) => false,
      );
}

extension NavigatorStateExtension on NavigatorState {
  /// Clears the current navigator stack and pushes a new route.
  ///
  /// The [newRoute] parameter is the new route to be pushed onto the navigator stack.
  ///
  /// Returns a `Future<T?>` that completes with the result of the new route.
  Future<T?> clear<T extends Object?>(Route<T> newRoute) =>
      pushAndRemoveUntil(newRoute, (_) => false);

  /// Clears the current navigator stack and pushes a new route.
  ///
  /// The [routeName] parameter is the name of the new route to be pushed onto the navigator stack.
  /// The [arguments] parameter is an optional object to be passed to the new route.
  ///
  /// Returns a `Future<T?>` that completes with the result of the new route.
  Future<T?> clearNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) =>
      pushNamedAndRemoveUntil(
        routeName,
        arguments: arguments,
        (_) => false,
      );
}
