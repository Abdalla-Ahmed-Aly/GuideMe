import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:guide_me/core/constants/api_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'socket_service.dart';

@LazySingleton(as: SocketService)
class SocketIOService implements SocketService {
  IO.Socket? _socket;
  final Map<String, List<Function(dynamic)>> _eventHandlers = {};

  @override
  bool get isConnected => _socket?.connected ?? false;

  @override
  void connect(String token) {
    _socket?.dispose();

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

    // Re-attach all existing handlers to the new socket instance
    _eventHandlers.forEach((event, handlers) {
      for (var handler in handlers) {
        _socket!.on(event, handler);
      }
    });

    _socket!.connect();
  }

  @override
  void disconnect() {
    _socket?.dispose();
    _socket = null;
    _eventHandlers.clear();
  }

  @override
  Stream<dynamic> on(String event) {
    final controller = StreamController<dynamic>.broadcast();

    void handler(data) {
      if (!controller.isClosed) {
        controller.add(data);
      }
    }

    _eventHandlers.putIfAbsent(event, () => []).add(handler);
    _socket?.on(event, handler);

    controller.onCancel = () {
      _eventHandlers[event]?.remove(handler);
      _socket?.off(event, handler);
      controller.close();
    };

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
