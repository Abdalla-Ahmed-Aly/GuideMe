class BookingModel {
  final String id;
  final String user;
  final String place;
  final String startTime;
  final String endTime;
  final int persons;
  final double totalPrice;
  final String status;

  const BookingModel({
    required this.id,
    required this.user,
    required this.place,
    required this.startTime,
    required this.endTime,
    required this.persons,
    required this.totalPrice,
    required this.status,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    id: json['_id'],
    user: json['user'],
    place: json['place'],
    startTime: json['startTime'],
    endTime: json['endTime'],
    persons: json['persons'],
    totalPrice: (json['totalPrice'] as num).toDouble(),
    status: json['status'],
  );
}