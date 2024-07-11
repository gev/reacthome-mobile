abstract interface class BusEmitter<T> {
  void emit(T event);
}

abstract class GenericBusEmitter<T> implements BusEmitter<T> {
  final Sink<T> eventSink;

  const GenericBusEmitter({required this.eventSink});

  @override
  void emit(T event) => eventSink.add(event);
}
