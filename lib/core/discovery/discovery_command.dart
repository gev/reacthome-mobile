abstract interface class DiscoveryCommand {
  void start();
  void completeStart<S>(source);
  void stop();
  void completeStop();
}
