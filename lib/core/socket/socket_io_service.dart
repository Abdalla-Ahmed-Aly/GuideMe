import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:guide_me/core/constants/api_constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'socket_service.dart';

class SocketIOService implements SocketService {
  IO.Socket? _socket;

  final Map<String, List<Function(dynamic)>> _eventHandlers = {};

  @override
  bool get isConnected => _socket?.connected ?? false;

  /// Binds all stored handlers onto the live socket.
  void _rebindAllHandlers() {
    _eventHandlers.forEach((event, handlers) {
      for (final handler in handlers) {
        _socket!.on(event, handler);
      }
    });
  }

  @override
  void connect(String token) {
    _socket?.disconnect();
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

    // _rebindAllHandlers();

    _socket!.onConnect((_) {
      debugPrint("✅ Socket Connected → Rebinding events...");
      _rebindAllHandlers();
    });

    _socket!.onAny((event, data) {
      log("🔥 EVENT RECEIVED: $event → $data");
    });

    _socket!.onDisconnect((reason) {
      debugPrint("❌ Disconnected: $reason");
    });

    _socket!.onError((error) {
      debugPrint("🔴 Error: $error");
    });
    _socket!.connect();
  }

  void _registerListeners(String token) {
    _socket!.on('conversationUpdated', (data) {
      log(' token: $token');
      log('conversationUpdated: $data');
    });

    _socket!.on('chatMessage', (data) {
      log(' token: $token');
      print('chatMessage: $data');
    });

    _socket!.on('newBooking', (data) {
      print(' token: $token');
      print('newBooking: $data');
    });
  }

  @override
void disconnect() {
  _socket?.off('connect');
  _socket?.off('disconnect');
  _socket?.off('error');
  
  _socket?.clearListeners(); 
  
  _socket?.disconnect();
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

    // Always store handler for rebinding after reconnect.
    _eventHandlers.putIfAbsent(event, () => []);
    _eventHandlers[event]!.add(handler);

    // If socket already exists, bind immediately (handles late subscriptions).
    _socket?.on(event, handler);

    controller.onCancel = () {
      _eventHandlers[event]?.remove(handler);
      _socket?.off(event, handler);
      if (!controller.isClosed) controller.close();
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
