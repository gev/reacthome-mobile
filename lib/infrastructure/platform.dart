import 'dart:io';

T selectPlatform<T>({
  required T cupertino,
  required T material,
}) =>
    Platform.isIOS || Platform.isMacOS ? cupertino : material;
