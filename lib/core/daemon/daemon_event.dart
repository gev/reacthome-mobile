sealed class DaemonEvent {
  final String daemon;
  DaemonEvent(this.daemon);
}

class DaemonMetaChangedEvent extends DaemonEvent {
  DaemonMetaChangedEvent(super.daemon);
}

class DaemonAddressChangedEvent extends DaemonEvent {
  DaemonAddressChangedEvent(super.daemon);
}

class DaemonProjectChangedEvent extends DaemonEvent {
  DaemonProjectChangedEvent(super.daemon);
}

class DaemonAddedEvent extends DaemonEvent {
  DaemonAddedEvent(super.daemon);
}

class DaemonRemovedEvent extends DaemonEvent {
  DaemonRemovedEvent(super.daemon);
}

class DaemonConfirmedEvent extends DaemonEvent {
  DaemonConfirmedEvent(super.daemon);
}
