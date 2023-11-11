sealed class DiscoveryEvent {}

class DiscoveryEventStartRequested extends DiscoveryEvent {}

class DiscoveryEventStartCompleted<S> extends DiscoveryEvent {
  final S source;
  DiscoveryEventStartCompleted(this.source);
}

class DiscoveryEventRejected<S> extends DiscoveryEvent {
  final S source;
  DiscoveryEventRejected(this.source);
}

class DiscoveryEventStopRequested extends DiscoveryEvent {}

class DiscoveryEventStopCompleted extends DiscoveryEvent {}
