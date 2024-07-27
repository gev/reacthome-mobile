import 'package:reacthome/common/emitter.dart';
import 'package:reacthome/common/entity.dart';
import 'package:reacthome/common/entity_event.dart';
import 'package:reacthome/common/repository/map_repository.dart';

class CachedMapRepository<E extends Entity<String>>
    implements MapRepository<String, E> {
  final MapRepository<String, E> repository;
  final Emitter<EntityEvent> eventSink;

  CachedMapRepository({required this.repository, required this.eventSink}) {
    final ids = repository.keys;
    if (ids.isNotEmpty) {
      eventSink.emit(EntityPoolRegisteredEvent(ids));
    }
  }

  @override
  int get length => repository.length;

  @override
  Iterable<String> get keys => repository.keys;

  @override
  Iterable<E> get values => repository.values;

  @override
  bool has(String id) => repository.has(id);

  @override
  E? get(String id) => repository.get(id);

  @override
  void put(E entity) {
    repository.put(entity);
    eventSink.emit(EntityRegisteredEvent(entity.id));
  }

  @override
  E? remove(String id) {
    eventSink.emit(EntityUnregisteredEvent(id));
    return repository.remove(id);
  }

  @override
  void clear() {
    final ids = repository.keys;
    if (ids.isNotEmpty) {
      eventSink.emit(EntityPoolUnregisteredEvent(ids));
    }
    repository.clear();
  }
}
