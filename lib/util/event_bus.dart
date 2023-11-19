import 'dart:async';

abstract interface class EventBus<E> {
  void emit(E event);
  StreamSubscription<E> listen(void Function(E) onData);
}

class GenericEventBus<E> implements EventBus<E> {
  final _controller = StreamController<E>.broadcast();

  @override
  void emit(E value) => _controller.add(value);

  @override
  StreamSubscription<E> listen(void Function(E) onData) =>
      _controller.stream.listen(onData);

  void dispose() => _controller.close();
}
