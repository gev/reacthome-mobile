import 'package:reacthome/util/event_bus.dart';

abstract class EventEmitter<T> {
  final EventBus<T> eventBus;

  EventEmitter(this.eventBus);

  void emit(T event) => eventBus.emit(event);
}
