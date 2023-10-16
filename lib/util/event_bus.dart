import 'dart:async';

class EventBus<T> {
  final _controller = StreamController<T>.broadcast();

  void emit(T value) => _controller.add(value);

  StreamSubscription<T> listen(void Function(T) onData) =>
      _controller.stream.listen(onData);

  void dispose() => _controller.close();
}
