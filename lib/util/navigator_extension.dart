import 'package:flutter/widgets.dart';

class NavigatorExtension {
  NavigatorExtension._();

  static Future<T?> clear<T extends Object?>(
    BuildContext context,
    Route<T> newRoute,
  ) =>
      Navigator.pushAndRemoveUntil(
        context,
        newRoute,
        (_) => false,
      );

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
  Future<T?> clear<T extends Object?>(Route<T> newRoute) =>
      pushAndRemoveUntil(newRoute, (_) => false);

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
