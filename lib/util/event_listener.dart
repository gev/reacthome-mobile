// ignore_for_file: unused_field

import 'dart:async';

import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/handler.dart';

abstract interface class EventListener<E> implements Handler<E> {}

abstract class GenericEventListener<E> extends Object
    implements EventListener<E> {
  late StreamSubscription<E> _subscription;

  GenericEventListener({required EventBus<E> eventSource}) {
    _subscription = eventSource.listen(handle);
  }

  void cancelSubscription() => _subscription.cancel();
}
