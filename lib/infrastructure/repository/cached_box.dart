import 'package:reacthome/common/box.dart';
import 'package:reacthome/common/emitter.dart';
import 'package:reacthome/common/entity.dart';
import 'package:reacthome/common/entity_event.dart';
import 'package:reacthome/util/extensions.dart';

class CachedBox<E extends Entity<String>> implements Box<E> {
  final Emitter<EntityEvent> eventSink;
  final Box<E> box;

  CachedBox({required this.eventSink, required this.box}) {
    box.get()?.let((e) => eventSink.emit(EntityRegisteredEvent(e.id)));
  }

  @override
  E? get() => box.get();

  @override
  void put(E entity) {
    box.put(entity);
    eventSink.emit(EntityRegisteredEvent(entity.id));
  }

  @override
  void clear() {
    box.get()?.let((e) => eventSink.emit(EntityUnregisteredEvent(e.id)));
    box.clear();
  }
}
