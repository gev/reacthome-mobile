import 'dart:async';

abstract interface class EventBus<E> {
  void emit(E event);
  StreamSubscription<E> listen(void Function(E) handle);
}

class GenericEventBus<E> implements EventBus<E> {
  final _controller = StreamController<E>.broadcast();

  @override
  void emit(E event) => _controller.add(event);

  @override
  StreamSubscription<E> listen(void Function(E) handle) =>
      _controller.stream.listen(handle);

  void close() => _controller.close();
}
