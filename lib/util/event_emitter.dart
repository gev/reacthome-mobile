import 'package:reacthome/util/event_bus.dart';

abstract class EventEmitter<T> {
  final EventBus<T> eventSink;

  EventEmitter({required this.eventSink});

  void emit(T event) => eventSink.emit(event);
}
