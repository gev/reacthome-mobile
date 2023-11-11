abstract interface class DiscoveryCommand<S> {
  void start();
  void completeStart(S source);
  void stop();
  void completeStop();
}
