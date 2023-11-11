sealed class DiscoveryEvent {}

class DiscoveryEventStartRequested extends DiscoveryEvent {}

class DiscoveryEventStartCompleted extends DiscoveryEvent {}

class DiscoveryEventRejected<S> extends DiscoveryEvent {
  final S source;
  DiscoveryEventRejected(this.source);
}

class DiscoveryEventStopRequested<S> extends DiscoveryEvent {
  final S source;
  DiscoveryEventStopRequested(this.source);
}

class DiscoveryEventStopCompleted extends DiscoveryEvent {}
