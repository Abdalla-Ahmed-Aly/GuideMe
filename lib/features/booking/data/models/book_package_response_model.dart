class BookPackageResponseModel {
  final String id;
  final String userId;
  final List<String> bookingIds;
  final DateTime tripDate;
  final String status;
  final double totalPrice;
  final String packagePhoto;
  final DateTime createdAt;

  const BookPackageResponseModel({
    required this.id,
    required this.userId,
    required this.bookingIds,
    required this.tripDate,
    required this.status,
    required this.totalPrice,
    required this.packagePhoto,
    required this.createdAt,
  });

  factory BookPackageResponseModel.fromJson(Map<String, dynamic> json) {
    return BookPackageResponseModel(
      id: json['_id'],
      userId: json['user'],
      bookingIds: List<String>.from(json['bookings']),
      tripDate: DateTime.parse(json['tripDate']),
      status: json['status'],
      totalPrice: (json['totalPrice'] as num).toDouble(),
      packagePhoto: json['packagePhoto'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}