import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_emitter.dart';
import 'package:reacthome/util/bus_listener.dart';

abstract class BusTransformer<L, E> extends BusListener<L>
    implements BusEmitter<E> {
  late Bus<E> bus;

  BusTransformer({required Bus<L> source, required Bus<E> sink})
      : super(source) {
    bus = sink;
  }

  @override
  void emit(E event) => bus.emit(event);
}