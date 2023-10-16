import 'dart:io';

T selectPlatform<T>({required T ios, required T android}) =>
    Platform.isIOS || Platform.isMacOS ? ios : android;
