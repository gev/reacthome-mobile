sealed class DiscoveryEvent {}

class DiscoveryStartRequestedEvent extends DiscoveryEvent {}

class DiscoveryStartCompletedEvent extends DiscoveryEvent {}

class DiscoveryRejectedEvent<S> extends DiscoveryEvent {
  final S source;
  DiscoveryRejectedEvent(this.source);
}

class DiscoveryStopRequestedEvent<S> extends DiscoveryEvent {
  final S source;
  DiscoveryStopRequestedEvent(this.source);
}

class DiscoveryStopCompletedEvent extends DiscoveryEvent {}
