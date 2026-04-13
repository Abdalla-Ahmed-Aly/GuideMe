class SocketRoom {
  final String joinEvent;
  final String leaveEvent;
  final String payload;

  const SocketRoom({
    required this.joinEvent,
    required this.leaveEvent,
    required this.payload,
  });

  @override
  bool operator ==(Object other) =>
      other is SocketRoom &&
      other.joinEvent == joinEvent &&
      other.payload.toString() == payload.toString();

  @override
  int get hashCode => Object.hash(joinEvent, payload.toString());

  @override
  String toString() => 'SocketRoom($joinEvent, $payload)';
}

class SocketRooms {
  SocketRooms._();

  static SocketRoom joinBooking(String bookingId) => SocketRoom(
    joinEvent: 'joinBooking',
    leaveEvent: 'leaveBooking',
    payload: bookingId,
  );
}
