import 'package:reacthome/util/event_bus.dart';

abstract interface class EventEmitter<T> {
  void emit(T event);
}

abstract class GenericEventEmitter<T> implements EventEmitter<T> {
  final EventBus<T> eventSink;

  GenericEventEmitter({required this.eventSink});

  @override
  void emit(T event) => eventSink.emit(event);
}
