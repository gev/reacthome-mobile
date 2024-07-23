import 'package:reacthome/common/emitter.dart';
import 'package:reacthome/common/entity.dart';
import 'package:reacthome/common/entity_event.dart';
import 'package:reacthome/common/repository.dart';

class CachedRepository<E extends Entity<String>>
    implements Repository<String, E> {
  final Repository<String, E> repository;
  final Emitter<EntityEvent> eventSink;

  CachedRepository({required this.repository, required this.eventSink}) {
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
