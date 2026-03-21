// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

@lazySingleton
class ConnectivityHelper {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _subscription;

  bool _wasDisconnected = false;

  Future<bool> isConnected() async {
    final List<ConnectivityResult> connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    }
    return connectivityResult.isNotEmpty;
  }

  void listeningToConnectivity({
    required Function onConnected,
    VoidCallback? onDisconnected,
  }) {
    _subscription = _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> results) {
        if (results.contains(ConnectivityResult.none)) {
          _wasDisconnected = true;
          onDisconnected?.call();
        } else {
          if (_wasDisconnected) {
            _wasDisconnected = false;
            onConnected();
          }
        }
      },
    );
  }

  void dispose() {
    _subscription?.cancel();
    _subscription = null;
  }
}