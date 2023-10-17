import 'dart:async';

import 'package:reacthome/util/actor.dart';
import 'package:reacthome/util/event_bus.dart';

abstract mixin class EventListener<T> implements Actor<T> {
  StreamSubscription<T>? _subscription;

  void subscribe(EventBus<T> eventBus) {
    _subscription = eventBus.listen(run);
  }

  void dispose() => _subscription?.cancel();
}
