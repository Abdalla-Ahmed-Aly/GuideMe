import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:guide_me/core/constants/api_constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'socket_service.dart';

class SocketIOService implements SocketService {
  IO.Socket? _socket;

  final Map<String, List<Function(dynamic)>> _eventHandlers = {};
  final List<void Function(String event, dynamic data)> _anyHandlers = [];
  final List<VoidCallback> _connectHandlers = [];
  final List<void Function(String reason)> _disconnectHandlers = [];
  final List<VoidCallback> _reconnectHandlers = [];
  final List<void Function(dynamic error)> _errorHandlers = [];

  @override
  bool get isConnected => _socket?.connected ?? false;

  void _bindStoredHandlers() {
    _eventHandlers.forEach((event, handlers) {
      _socket!.off(event);
      for (final handler in handlers) {
        _socket!.on(event, handler);
      }
    });
  }

  void _bindCoreListeners() {
    _socket!.onAny((event, data) {
      log("🔥 EVENT RECEIVED: $event → $data");
      for (final handler in _anyHandlers) {
        handler(event.toString(), data);
      }
    });

    _socket!.onConnect((_) {
      debugPrint('✅ Socket Connected: ${_socket?.id}');
      for (final handler in _connectHandlers) {
        handler();
      }
    });

    _socket!.onDisconnect((reason) {
      debugPrint("❌ Disconnected: $reason");
      for (final handler in _disconnectHandlers) {
        handler(reason.toString());
      }
    });

    _socket!.on('reconnect', (_) {
      for (final handler in _reconnectHandlers) {
        handler();
      }
    });

    _socket!.onError((error) {
      debugPrint("🔴 Error: $error");
      for (final handler in _errorHandlers) {
        handler(error);
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

    _bindCoreListeners();
    _bindStoredHandlers();
    _socket!.connect();
  }

  @override
  void disconnect() {
    _socket?.off('connect');
    _socket?.off('disconnect');
    _socket?.off('error');
    _socket?.off('reconnect');

    _socket?.clearListeners();

    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;

    _eventHandlers.clear();
    _anyHandlers.clear();
    _connectHandlers.clear();
    _disconnectHandlers.clear();
    _reconnectHandlers.clear();
    _errorHandlers.clear();
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
    _anyHandlers.add(handler);
  }

  @override
  void onConnect(VoidCallback callback) {
    _connectHandlers.add(callback);
  }

  @override
  void onDisconnect(void Function(String reason) callback) {
    _disconnectHandlers.add(callback);
  }

  @override
  void onReconnect(VoidCallback callback) {
    _reconnectHandlers.add(callback);
  }

  @override
  void onError(void Function(dynamic error) callback) {
    _errorHandlers.add(callback);
  }
}
