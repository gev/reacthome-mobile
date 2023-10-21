sealed class DiscoveryEvent {
  final String daemon;
  DiscoveryEvent(this.daemon);
}

class DiscoveryEventDaemonAdded extends DiscoveryEvent {
  DiscoveryEventDaemonAdded(super.daemon);
}

class DiscoveryEventDaemonRemoved extends DiscoveryEvent {
  DiscoveryEventDaemonRemoved(super.daemon);
}
