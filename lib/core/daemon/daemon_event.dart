sealed class DaemonEvent {
  final String daemon;
  DaemonEvent(this.daemon);
}

class DaemonEventMetaChanged extends DaemonEvent {
  DaemonEventMetaChanged(super.daemon);
}

class DaemonEventAddressChanged extends DaemonEvent {
  DaemonEventAddressChanged(super.daemon);
}

class DaemonEventProjectChanged extends DaemonEvent {
  DaemonEventProjectChanged(super.daemon);
}

class DaemonEventAdded extends DaemonEvent {
  DaemonEventAdded(super.daemon);
}

class DaemonEventRemoved extends DaemonEvent {
  DaemonEventRemoved(super.daemon);
}

class DaemonEventConfirmed extends DaemonEvent {
  DaemonEventConfirmed(super.daemon);
}
