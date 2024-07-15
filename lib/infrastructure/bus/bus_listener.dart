// ignore_for_file: unused_field

import 'dart:async';

import 'package:reacthome/entity_framework/handler.dart';

abstract class BusListener<E> extends Object implements Handler<E> {
  late StreamSubscription<E> _subscription;

  BusListener({required Stream<E> eventSource}) {
    _subscription = eventSource.listen(handle);
  }

  void cancelSubscription() => _subscription.cancel();
}
