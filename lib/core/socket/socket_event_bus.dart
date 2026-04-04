import 'package:injectable/injectable.dart';
import 'socket_service.dart';

@lazySingleton
class SocketEventBus {
  final SocketService _service;

  SocketEventBus(this._service);

  Stream<dynamic> listenTo(String event) => _service.on(event);

  void emit(String event, [dynamic data]) => _service.emit(event, data);
}
