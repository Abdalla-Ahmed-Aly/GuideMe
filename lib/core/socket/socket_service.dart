import 'package:flutter/foundation.dart';

abstract class SocketService {
  bool get isConnected;
  void connect(String token);
  void disconnect();
  Stream<dynamic> on(String event);
  void emit(String event, [dynamic data]);
  void onAny(void Function(String event, dynamic data) handler);
  void onConnect(VoidCallback callback);
  void onDisconnect(void Function(String reason) callback);
  void onReconnect(VoidCallback callback);
  void onError(void Function(dynamic error) callback);
}
