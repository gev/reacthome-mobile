import 'dart:async';

import 'package:reacthome/util/replay_latest_stream.dart';

abstract interface class Bus<T> {
  void emit(T value);
  Stream<T> get stream;
  StreamSubscription<T> listen(void Function(T) handle);
}

class EventBus<E> implements Bus<E> {
  final _controller = StreamController<E>.broadcast();

  @override
  Stream<E> get stream => _controller.stream;

  @override
  StreamSubscription<E> listen(void Function(E) handle) =>
      _controller.stream.listen(handle);

  @override
  void emit(E event) {
    _controller.add(event);
  }

  void close() {
    _controller.close();
  }
}

class StateBus<S> extends EventBus<S> {
  late final Stream<S> stream;

  StateBus(S startWith) {
    stream = ReplayLatestStream(startWith, _controller.stream);
  }

  @override
  StreamSubscription<S> listen(void Function(S) handle) =>
      stream.listen(handle);
}
