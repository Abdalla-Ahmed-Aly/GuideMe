import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/domain/use_case/accept_booking_use_case.dart';
import 'package:guide_me/features/dashboard/domain/use_case/decline_booking_use_case.dart';
import 'package:injectable/injectable.dart';

part 'accept_booking_state.dart';

@injectable
class AcceptBookingCubit extends Cubit<AcceptBookingState> {
  final AcceptBookingUseCase acceptBookingUseCase;
  final DeclineBookingUseCase declineBookingUseCase;

  AcceptBookingCubit(this.acceptBookingUseCase, this.declineBookingUseCase)
    : super(AcceptBookingInitial());

  bool isRunning = false;

  void safeEmit(AcceptBookingState state) {
    if (!isClosed) emit(state);
  }

  Future<void> acceptBooking(String bookingId) async {
    if (isRunning) return;
    isRunning = true;
    safeEmit(AcceptBookingLoading(bookingId, isAccept: true));
    final result = await acceptBookingUseCase(bookingId);
    result.fold(
      (failure) {
        isRunning = false;
        safeEmit(AcceptBookingFailure(failure, bookingId));
      },
      (_) {
        isRunning = false;
        safeEmit(AcceptBookingSuccess(bookingId));
      },
    );
  }

  Future<void> declineBooking(String bookingId) async {
    if (isRunning) return;
    isRunning = true;
    safeEmit(AcceptBookingLoading(bookingId, isDecline: true));

    final result = await declineBookingUseCase(bookingId);

    result.fold(
      (failure) {
        isRunning = false;
        safeEmit(AcceptBookingFailure(failure, bookingId));
      },
      (_) {
        isRunning = false;
        safeEmit(DeclineBookingSuccess(bookingId));
      },
    );
  }
}
