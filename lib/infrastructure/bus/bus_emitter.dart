import 'package:reacthome/common/emitter.dart';

class BusEmitter<T> implements Emitter<T> {
  final Sink<T> eventSink;

  const BusEmitter({required this.eventSink});

  @override
  void emit(T event) => eventSink.add(event);
}
