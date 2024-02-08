import 'dart:io';

T selectPlatform<T>({
  required T Function() cupertino,
  required T Function() material,
}) =>
    Platform.isIOS || Platform.isMacOS ? cupertino() : material();
