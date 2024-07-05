import 'package:flutter/widgets.dart';

enum InstanceType { singleton, factory, builder }

typedef Instance = (
  InstanceType,
  dynamic,
);

typedef Factory<T> = T Function();
typedef Builder<T> = T Function(BuildContext context);

class SL {
  static final SL instance = SL._();

  SL._();

  final Map<dynamic, Instance> _store = {};

  T get<T>([BuildContext? context]) {
    final (type, instance) = _store[T]!;
    switch (type) {
      case InstanceType.singleton:
        return instance as T;
      case InstanceType.factory:
        return (instance as Factory<T>)();
      case InstanceType.builder:
        return (instance as Builder<T>)(context!);
    }
  }

  void register<T>(T instance) =>
      _register<T>(InstanceType.singleton, instance);

  void registerFactory<T>(Factory<T> factory) =>
      _register<T>(InstanceType.factory, factory);

  void registerBuilder<T>(Builder<T> builder) =>
      _register<T>(InstanceType.builder, builder);

  void _register<T>(InstanceType type, dynamic instance) {
    _store[T] = (type, instance);
  }
}

final $ = SL.instance;
