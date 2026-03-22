import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/booking/domain/repos/booking_repo.dart';
import 'package:injectable/injectable.dart';

part 'cancel_booking_state.dart';

@injectable
class CancelBookingCubit extends Cubit<CancelBookingState> {
  CancelBookingCubit(this._bookingRepo) : super(CancelBookingInitial());
  final BookingRepo _bookingRepo;

  void safeEmit(CancelBookingState state) {
    if (!isClosed) emit(state);
  }

  Future<void> cancelBooking({
    required String bookingId,
  }) async {
    safeEmit(CancelBookingLoading());

    final result = await _bookingRepo.cancelBooking(bookingId: bookingId);

    result.fold(
      (failure) => safeEmit(CancelBookingFailure(failure: failure)),
      (booking) => safeEmit(CancelBookingSuccess()),
    );
  }
}
