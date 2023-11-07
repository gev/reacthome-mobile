import 'dart:io';

typedef Factory<T> = T Function();

T selectPlatform<T>({required Factory<T> ios, required Factory<T> android}) =>
    Platform.isIOS || Platform.isMacOS ? ios() : android();
