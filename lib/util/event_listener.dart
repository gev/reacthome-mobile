import 'dart:async';

import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/handler.dart';

abstract mixin class EventListener<T> implements Handler<T> {
  StreamSubscription<T>? _subscription;

  void subscribe(EventBus<T> eventBus) {
    _subscription = eventBus.listen(onData);
  }

  void dispose() => _subscription?.cancel();
}
