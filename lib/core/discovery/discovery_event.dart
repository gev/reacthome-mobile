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

class DiscoveryEventDaemonMetaChanged extends DiscoveryEvent {
  DiscoveryEventDaemonMetaChanged(super.daemon);
}

class DiscoveryEventDaemonAddressChanged extends DiscoveryEvent {
  DiscoveryEventDaemonAddressChanged(super.daemon);
}

class DiscoveryEventDaemonProjectChanged extends DiscoveryEvent {
  DiscoveryEventDaemonProjectChanged(super.daemon);
}

class DiscoveryEventDaemonRemoved extends DiscoveryEvent {
  DiscoveryEventDaemonRemoved(super.daemon);
}
