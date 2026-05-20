import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/booking/data/models/review_status_response.dart';
import 'package:guide_me/features/booking/data/models/review_trip_request.dart';
import 'package:guide_me/features/booking/domain/repos/booking_repo.dart';
import 'package:injectable/injectable.dart';

part 'review_state.dart';

@injectable
class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(this._bookingRepo) : super(ReviewInitial());

  final BookingRepo _bookingRepo;

  void safeEmit(ReviewState state) {
    if (!isClosed) emit(state);
  }

  Future<void> checkReviewStatus({required String bookingId}) async {
    safeEmit(CheckReviewStatusLoading());
    final result = await _bookingRepo.checkReviewStatus(bookingId: bookingId);
    result.fold(
      (failure) => safeEmit(CheckReviewStatusFailure(failure)),
      (reviewStatus) => safeEmit(CheckReviewStatusSuccess(reviewStatus)),
    );
  }

  Future<void> reviewTrip({required ReviewTripRequest request}) async {
    safeEmit(ReviewTripLoading());
    final result = await _bookingRepo.reviewTrip(request: request);
    result.fold(
      (failure) => safeEmit(ReviewTripFailure(failure)),
      (_) => safeEmit(ReviewTripSuccess()),
    );
  }
}
