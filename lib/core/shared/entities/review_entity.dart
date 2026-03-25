class ReviewEntity {
  final String id;
  final String touristName;
  final String? touristPhoto;
  final int rating;
  final String comment;
  final DateTime? createdAt;

  const ReviewEntity({
    required this.id,
    required this.touristName,
    required this.touristPhoto,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });
}
