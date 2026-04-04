import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'socket_service.dart';
import 'socket_room.dart';

@lazySingleton
class SocketManager {
  final SocketService _service;
  final Set<SocketRoom> _activeRooms = {};

  SocketManager(this._service);

  void connect(String token) {
    _service.connect(token);
    _setupConnectionListeners();
  }

  void _setupConnectionListeners() {
    _service.onConnect(() {
      debugPrint('✅ Socket Connected');
    });

    _service.onDisconnect((reason) {
      debugPrint('❌ Socket Disconnected: $reason');
    });

    _service.onError((error) {
      debugPrint('🔴 Socket Error: $error');
    });

    _service.onReconnect(() {
      debugPrint('🔄 Reconnected — rejoining ${_activeRooms.length} rooms...');
      for (final room in Set.from(_activeRooms)) {
        _emitJoin(room);
      }
    });
  }

  void joinRoom(SocketRoom room) {
    _activeRooms.add(room);
    _emitJoin(room);
  }

  void leaveRoom(SocketRoom room) {
    _activeRooms.remove(room);
    _service.emit(room.leaveEvent, room.payload);
    debugPrint('🚪 Left room: ${room.leaveEvent} → ${room.payload}');
  }

  void _emitJoin(SocketRoom room) {
    _service.emit(room.joinEvent, room.payload);
    debugPrint('🚀 Joined room: ${room.joinEvent} → ${room.payload}');
  }

  void dispose() {
    _activeRooms.clear();
    _service.disconnect();
    debugPrint('🔌 Socket disposed');
  }

  Set<SocketRoom> get activeRooms => Set.unmodifiable(_activeRooms);
}
