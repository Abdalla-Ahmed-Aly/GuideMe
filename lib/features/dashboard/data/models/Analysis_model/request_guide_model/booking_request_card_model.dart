class BookingRequestModel {
  final String id;
  final int persons;
  final int totalPrice;
  final String status;
  final String userName;
  final String placeTitle;

  BookingRequestModel({
    required this.id,
    required this.persons,
    required this.totalPrice,
    required this.status,
    required this.userName,
    required this.placeTitle,
  });

  factory BookingRequestModel.fromJson(Map<String, dynamic> json) {
    return BookingRequestModel(
      id: json['_id'],
      persons: json['persons'],
      totalPrice: json['totalPrice'],
      status: json['status'],
      userName: json['user']['name'] ?? 'Unknown User',
      placeTitle: json['place']['title'] ?? 'No Title',
    );
  }
}