sealed class HomeEvent {
  final String id;
  const HomeEvent(this.id);
}

class HomeMetaChangedEvent extends HomeEvent {
  const HomeMetaChangedEvent(super.id);
}

class HomeAddressChangedEvent extends HomeEvent {
  const HomeAddressChangedEvent(super.id);
}

class HomeProjectChangedEvent extends HomeEvent {
  const HomeProjectChangedEvent(super.id);
}

class HomeAddedEvent extends HomeEvent {
  const HomeAddedEvent(super.id);
}

class HomeRemovedEvent extends HomeEvent {
  const HomeRemovedEvent(super.id);
}

class HomeRenewEvent extends HomeEvent {
  const HomeRenewEvent(super.id);
}
