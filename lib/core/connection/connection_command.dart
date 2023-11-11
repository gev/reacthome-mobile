abstract class ConnectionCommand<S> {
  void connect({required String id});
  void completeLocalConnect({
    required String id,
    required S socket,
  });
  void completeCloudConnect({
    required String id,
    required S socket,
  });
  void disconnect({required String id});
  void completeDisconnect({required String id});
}
