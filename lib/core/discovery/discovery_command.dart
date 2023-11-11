abstract interface class DiscoveryCommand {
  void start();
  void completeStart<S>(S source);
  void stop();
  void completeStop();
}
