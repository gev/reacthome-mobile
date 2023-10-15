sealed class DiscoveryEvent {
  const DiscoveryEvent();
}

class DiscoveryEventStart extends DiscoveryEvent {
  const DiscoveryEventStart();
}

class DiscoveryEventStop extends DiscoveryEvent {
  const DiscoveryEventStop();
}

class DiscoveryEventCounterChanged extends DiscoveryEvent {
  final int value;
  const DiscoveryEventCounterChanged(this.value);
}
