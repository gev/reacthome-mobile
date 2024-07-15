import 'package:reacthome/features/home/home.dart';

sealed class HomeEvent {
  final Home home;
  const HomeEvent(this.home);
}

class HomeMetaChangedEvent extends HomeEvent {
  const HomeMetaChangedEvent(super.home);
}

class HomeAddressChangedEvent extends HomeEvent {
  const HomeAddressChangedEvent(super.home);
}

class HomeProjectChangedEvent extends HomeEvent {
  const HomeProjectChangedEvent(super.home);
}

class HomeAddedEvent extends HomeEvent {
  const HomeAddedEvent(super.home);
}

class HomeRemovedEvent extends HomeEvent {
  const HomeRemovedEvent(super.home);
}

class HomeRenewEvent extends HomeEvent {
  const HomeRenewEvent(super.home);
}
