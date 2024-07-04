import 'dart:async';

import 'package:reacthome/util/replay_latest_stream.dart';

class Bus<T> {
  late final Sink<T> sink;
  late final Stream<T> stream;
  final _controller = StreamController<T>.broadcast();

  Bus({T? startWith}) {
    sink = _controller.sink;
    switch (startWith) {
      case null:
        stream = _controller.stream;
      default:
        stream = ReplayLatestStream(startWith, _controller.stream);
    }
  }

  void close() {
    _controller.close();
  }
}
