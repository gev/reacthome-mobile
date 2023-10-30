import 'package:reacthome/util/event_bus.dart';

abstract class EventEmitter<T> {
  final EventBus<T> bus;

  EventEmitter(this.bus);

  void emit(T event) => bus.emit(event);
}
