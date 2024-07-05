import 'dart:async';

class Bus<T> {
  final _controller = StreamController<T>.broadcast();

  Sink<T> get sink => _controller.sink;
  Stream<T> get stream => _controller.stream;

  void close() {
    _controller.close();
  }
}
