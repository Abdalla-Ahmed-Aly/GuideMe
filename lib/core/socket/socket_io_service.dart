import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:guide_me/core/constants/api_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'socket_service.dart';

@LazySingleton(as: SocketService)
class SocketIOService implements SocketService {
  IO.Socket? _socket;

  // Cache one broadcast controller per event so repeated calls to on()
  // don't register duplicate socket listeners.
  final Map<String, StreamController<dynamic>> _controllers = {};

  @override
  bool get isConnected => _socket?.connected ?? false;

  @override
  void connect(String token) {
    _socket?.dispose();
    // Clear cached controllers so listeners are re-registered on the new socket.
    for (final c in _controllers.values) {
      c.close();
    }
    _controllers.clear();

    _socket = IO.io(
      ApiConstants.baseUrl,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setQuery({'token': token})
          .enableReconnection()
          .setReconnectionAttempts(10)
          .setReconnectionDelay(2000)
          .setReconnectionDelayMax(30000)
          .disableAutoConnect()
          .build(),
    );

    _socket!.connect();
  }

  @override
  void disconnect() {
    for (final c in _controllers.values) {
      c.close();
    }
    _controllers.clear();
    _socket?.dispose();
    _socket = null;
  }

  @override
  Stream<dynamic> on(String event) {
    if (_controllers.containsKey(event)) {
      return _controllers[event]!.stream;
    }
    final controller = StreamController<dynamic>.broadcast();
    _controllers[event] = controller;
    _socket?.on(event, (data) => controller.add(data));
    return controller.stream;
  }

  @override
  void emit(String event, [dynamic data]) {
    _socket?.emit(event, data);
  }

  @override
  void onAny(void Function(String event, dynamic data) handler) {
    _socket?.onAny((event, data) => handler(event.toString(), data));
  }

  @override
  void onConnect(VoidCallback callback) {
    _socket?.onConnect((_) => callback());
  }

  @override
  void onDisconnect(void Function(String reason) callback) {
    _socket?.onDisconnect((reason) => callback(reason.toString()));
  }

  @override
  void onReconnect(VoidCallback callback) {
    _socket?.on('reconnect', (_) => callback());
  }

  @override
  void onError(void Function(dynamic error) callback) {
    _socket?.onError((error) => callback(error));
  }
}
