class ReviewTripRequest {
  final String bookingId;
  final int rating;
  final String comment;

  ReviewTripRequest({
    required this.bookingId,
    required this.rating,
    required this.comment,
  });

  Map<String, dynamic> toJson() => {
    "bookingId": bookingId,
    "rating": rating,
    "comment": comment,
  };
}
