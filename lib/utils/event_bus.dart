import 'dart:async';

abstract mixin class EventHandler<T> {
  StreamSubscription<T>? _subscription;

  void handleEvent(T event);

  void subscribe(EventBus<T> eventBus) {
    _subscription = eventBus.listen(this);
  }

  void dispose() => _subscription?.cancel();
}

class EventBus<T> {
  final _controller = StreamController<T>.broadcast();

  void emit(T value) => _controller.add(value);

  StreamSubscription<T> listen(EventHandler<T> handler) =>
      _controller.stream.listen(handler.handleEvent);

  void dispose() => _controller.close();
}
