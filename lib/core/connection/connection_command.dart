abstract class ConnectionCommand {
  void connect({required String id});
  void completeLocalConnect<S>({
    required String id,
    required S socket,
  });
  void completeRemoteConnect<S>({
    required String id,
    required S socket,
  });
  void disconnect({required String id});
  void completeDisconnect({required String id});
}
