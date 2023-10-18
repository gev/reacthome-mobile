import 'dart:async';

import 'package:reacthome/util/actor.dart';
import 'package:reacthome/util/bus.dart';

abstract class BusListener<T> implements Actor<T> {
  late StreamSubscription<T> _subscription;

  BusListener(Bus<T> bus) {
    _subscription = bus.listen(run);
  }

  void dispose() => _subscription.cancel();
}
