sealed class EntityEvent {
  const EntityEvent();
}

class EntityRegisteredEvent extends EntityEvent {
  final String id;
  const EntityRegisteredEvent(this.id);
}

class EntityPoolRegisteredEvent extends EntityEvent {
  final Iterable<String> ids;
  const EntityPoolRegisteredEvent(this.ids);
}

class EntityUnregisteredEvent extends EntityEvent {
  final String id;
  const EntityUnregisteredEvent(this.id);
}

class EntityPoolUnregisteredEvent extends EntityEvent {
  final Iterable<String> ids;
  const EntityPoolUnregisteredEvent(this.ids);
}
