// ignore_for_file: unused_field

import 'dart:async';

import 'package:reacthome/infrastructure/handler.dart';

abstract interface class BusListener<E> implements Handler<E> {}

abstract class GenericBusListener<E> extends Object implements BusListener<E> {
  late StreamSubscription<E> _subscription;

  GenericBusListener({required Stream<E> eventSource}) {
    _subscription = eventSource.listen(handle);
  }

  void cancelSubscription() => _subscription.cancel();
}
