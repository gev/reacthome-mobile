sealed class DiscoveryEvent {
  const DiscoveryEvent();
}

class DiscoveryStartRequestedEvent extends DiscoveryEvent {
  const DiscoveryStartRequestedEvent();
}

class DiscoveryStartCompletedEvent extends DiscoveryEvent {
  const DiscoveryStartCompletedEvent();
}

class DiscoveryRejectedEvent<S> extends DiscoveryEvent {
  final S source;
  const DiscoveryRejectedEvent(this.source);
}

class DiscoveryStopRequestedEvent<S> extends DiscoveryEvent {
  final S source;
  const DiscoveryStopRequestedEvent(this.source);
}

class DiscoveryStopCompletedEvent extends DiscoveryEvent {
  const DiscoveryStopCompletedEvent();
}
