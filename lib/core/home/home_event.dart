sealed class HomeEvent {
  final String home;
  HomeEvent(this.home);
}

class HomeMetaChangedEvent extends HomeEvent {
  HomeMetaChangedEvent(super.home);
}

class HomeAddressChangedEvent extends HomeEvent {
  HomeAddressChangedEvent(super.home);
}

class HomeProjectChangedEvent extends HomeEvent {
  HomeProjectChangedEvent(super.home);
}

class HomeAddedEvent extends HomeEvent {
  HomeAddedEvent(super.home);
}

class HomeRemovedEvent extends HomeEvent {
  HomeRemovedEvent(super.home);
}

class HomeConfirmedEvent extends HomeEvent {
  HomeConfirmedEvent(super.home);
}
