part of 'review_cubit.dart';

abstract class ReviewState {}

final class ReviewInitial extends ReviewState {}

final class CheckReviewStatusLoading extends ReviewState {}

final class CheckReviewStatusSuccess extends ReviewState {
  final ReviewStatusResponse reviewStatus;
  CheckReviewStatusSuccess(this.reviewStatus);
}

final class CheckReviewStatusFailure extends ReviewState {
  final Failure failure;
  CheckReviewStatusFailure(this.failure);
}

final class ReviewTripLoading extends ReviewState {}

final class ReviewTripSuccess extends ReviewState {}

final class ReviewTripFailure extends ReviewState {
  final Failure failure;
  ReviewTripFailure(this.failure);
}
