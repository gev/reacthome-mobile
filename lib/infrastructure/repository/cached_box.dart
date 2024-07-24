import 'package:reacthome/common/box.dart';
import 'package:reacthome/common/emitter.dart';
import 'package:reacthome/common/entity.dart';
import 'package:reacthome/common/entity_event.dart';

class CachedBox<E extends Entity<String>> implements Box<E> {
  final Emitter<EntityEvent> eventSink;
  final Box<E> box;

  CachedBox({required this.eventSink, required this.box}) {
    eventSink.emit(EntityRegisteredEvent(box.value.id));
  }

  @override
  E get value => box.value;

  @override
  void put(E entity) {
    box.put(entity);
    eventSink.emit(EntityRegisteredEvent(entity.id));
  }
}
