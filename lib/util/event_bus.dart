import 'dart:async';

class EventBus<E> {
  final _controller = StreamController<E>.broadcast();

  void emit(E value) => _controller.add(value);

  StreamSubscription<E> listen(void Function(E) onData) =>
      _controller.stream.listen(onData);

  void dispose() => _controller.close();
}
