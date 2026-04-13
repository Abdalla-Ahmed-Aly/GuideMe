import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/guide_booking/domain/repos/guide_booking_repo.dart';
import 'package:injectable/injectable.dart';

part 'guide_booking_actions_state.dart';

@injectable
class GuideBookingActionsCubit extends Cubit<GuideBookingActionsState> {
  GuideBookingActionsCubit(this._bookingRepo)
    : super(GuideBookingActionsInitial());
  final GuideBookingRepo _bookingRepo;
  void safeEmit(GuideBookingActionsState state) {
    if (!isClosed) emit(state);
  }

  Future<void> startTour({required String bookingId}) async {
    safeEmit(GuideBookingActionsLoading(bookingId: bookingId));
    final result = await _bookingRepo.startTour(bookingId: bookingId);
    result.fold(
      (failure) {
        safeEmit(
          GuideBookingActionsFailure(failure: failure, bookingId: bookingId),
        );
      },
      (success) {
        safeEmit(GuideBookingStartSuccess(bookingId));
      },
    );
  }

  Future<void> endTour({required String bookingId}) async {
    safeEmit(GuideBookingActionsLoading(bookingId: bookingId));
    final result = await _bookingRepo.endTour(bookingId: bookingId);
    result.fold(
      (failure) {
        safeEmit(
          GuideBookingActionsFailure(failure: failure, bookingId: bookingId),
        );
      },
      (success) {
        safeEmit(GuideBookingEndSuccess(bookingId));
      },
    );
  }

  void resetState() {
    safeEmit(GuideBookingActionsInitial());
  }
}
