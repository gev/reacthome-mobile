import 'dart:async';

import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/handler.dart';

abstract class EventListener<E> implements Handler<E> {
  late StreamSubscription<E> _subscription;

  EventListener(EventBus<E> bus) {
    _subscription = bus.listen(handle);
  }

  void dispose() => _subscription.cancel();
}
