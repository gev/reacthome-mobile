import 'dart:async';

abstract interface class EventHandler<T> {
  void handleEvent(T event);
}

class EventBus<T> {
  final _controller = StreamController<T>.broadcast();

  void emit(T value) => _controller.add(value);

  StreamSubscription<T> subscribe(EventHandler<T> handler) =>
      _controller.stream.listen(handler.handleEvent);

  void dispose() => _controller.close();
}
