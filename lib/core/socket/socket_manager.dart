import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'socket_service.dart';
import 'socket_room.dart';

class SocketManager {
  final SocketService _service;
  final Set<SocketRoom> _activeRooms = {};

  SocketManager(this._service);

  void connect(String token) {
    _service.connect(token);
    _setupConnectionListeners();
  }

  void _setupConnectionListeners() {
    // onConnect fires for BOTH the initial connection and after every reconnect.
    // We re-join all active rooms here so rooms are never lost.
    _service.onConnect(() {
      debugPrint(
        '✅ Socket Connected — rejoining ${_activeRooms.length} active room(s)...',
      );
      log("Active Room: $_activeRooms & Service $_service");
      for (final room in Set.from(_activeRooms)) {
        _emitJoin(room);
      }
    });

    _service.onDisconnect((reason) {
      debugPrint('❌ Socket Disconnected: $reason');
    });

    _service.onError((error) {
      debugPrint('🔴 Socket Error: $error');
    });
  }

  void joinRoom(SocketRoom room) {
    _activeRooms.add(room);
    if (_service.isConnected) {
      _emitJoin(room);
    } else {
      debugPrint(
        '⏳ Socket not yet connected — room ${room.joinEvent}(${room.payload}) queued for join on connect.',
      );
    }
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
