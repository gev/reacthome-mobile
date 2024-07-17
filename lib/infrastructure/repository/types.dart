import 'dart:io';

typedef FileHandler = Future<void> Function(File file);

typedef To<T> = dynamic Function(T dst);

typedef From<T> = T Function(dynamic src);
