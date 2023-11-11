import 'package:reacthome/core/connection/connection_type.dart';

abstract class ConnectionCommand {
  void connect({required String id});
  void completeConnect<S>({
    required String id,
    required ConnectionType type,
    required S socket,
  });
  void disconnect({required String id});
  void completeDisconnect({required String id});
}
