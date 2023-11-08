import 'dart:io';

T selectPlatform<T>({
  required T Function() ios,
  required T Function() android,
}) =>
    Platform.isIOS || Platform.isMacOS ? ios() : android();
