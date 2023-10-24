sealed class DiscoveryEvent {
  final String daemon;
  DiscoveryEvent(this.daemon);
}

class DiscoveryEventDaemonAdded extends DiscoveryEvent {
  DiscoveryEventDaemonAdded(super.daemon);
}

class DiscoveryEventDaemonConfirmed extends DiscoveryEvent {
  DiscoveryEventDaemonConfirmed(super.daemon);
}

class DiscoveryEventDaemonChanged extends DiscoveryEvent {
  DiscoveryEventDaemonChanged(super.daemon);
}

class DiscoveryEventDaemonRemoved extends DiscoveryEvent {
  DiscoveryEventDaemonRemoved(super.daemon);
}
