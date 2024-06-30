import 'package:reacthome/util/bus.dart';

abstract interface class BusEmitter<T> {
  void emit(T event);
}

abstract class GenericBusEmitter<T> implements BusEmitter<T> {
  final Bus<T> eventSink;

  GenericBusEmitter({required this.eventSink});

  @override
  void emit(T event) => eventSink.emit(event);
}
