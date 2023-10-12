import 'dart:async';

class DataProvider<T> {
  final _controller = StreamController<T>.broadcast();

  void add(T value) => _controller.add(value);

  StreamSubscription<T> subscribe(void Function(T value) callback) =>
      _controller.stream.listen(callback);
}
