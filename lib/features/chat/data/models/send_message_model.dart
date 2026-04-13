class SendMessageModel {
  final String bookingId;
  final String message;

  SendMessageModel({required this.bookingId, required this.message});

  Map<String, dynamic> toJson() => {
    'bookingId': bookingId,
    'message': message,
  };
}
