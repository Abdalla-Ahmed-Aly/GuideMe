class CancelBookingResponse {
  final String id;
  final String user;
  final String place;
  final String bookingDate;
  final int persons;
  final double totalPrice;
  final String status;

  const CancelBookingResponse({
    required this.id,
    required this.user,
    required this.place,
    required this.bookingDate,
    required this.persons,
    required this.totalPrice,
    required this.status,
  });

  factory CancelBookingResponse.fromJson(Map<String, dynamic> json) {
    return CancelBookingResponse(
      id: json['_id'],
      user: json['user'],
      place: json['place'],
      bookingDate: json['bookingDate'],
      persons: json['persons'],
      totalPrice: (json['totalPrice'] as num).toDouble(),
      status: json['status'],
    );
  }
}
