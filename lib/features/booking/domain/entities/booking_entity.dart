class BookingEntity {
  final String id;
  final String user;
  final String place;
  final DateTime startTime;
  final DateTime endTime;
  final int persons;
  final double totalPrice;
  final String status;

  const BookingEntity({
    required this.id,
    required this.user,
    required this.place,
    required this.startTime,
    required this.endTime,
    required this.persons,
    required this.totalPrice,
    required this.status,
  });
}