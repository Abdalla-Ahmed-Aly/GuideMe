class ReviewStatusResponse {
  final bool canReview;
  final bool alreadyReviewed;

  ReviewStatusResponse({
    required this.canReview,
    required this.alreadyReviewed,
  });

  factory ReviewStatusResponse.fromJson(Map<String, dynamic> json) {
    return ReviewStatusResponse(
      canReview: json['canReview'],
      alreadyReviewed: json['alreadyReviewed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'canReview': canReview,
      'alreadyReviewed': alreadyReviewed,
    };
  }
}
