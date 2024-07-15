import 'dart:async';

import 'package:reacthome/features/emitter.dart';
import 'package:reacthome/infrastructure/bus/bus_emitter.dart';

class Bus<T> {
  final _controller = StreamController<T>.broadcast();

  Emitter<T> get sink => BusEmitter(eventSink: _controller.sink);
  Stream<T> get stream => _controller.stream;

  void close() {
    _controller.close();
  }
}
