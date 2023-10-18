import 'package:reacthome/util/bus.dart';

abstract interface class BusEmitter<T> {
  void emit(T event);
}

abstract class SimpleBusEmitter<T> implements BusEmitter<T> {
  final Bus<T> bus;

  SimpleBusEmitter(this.bus);

  @override
  void emit(T event) => bus.emit(event);
}
