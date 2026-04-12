

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/dashboard/domain/use_case/accept_booking_use_case.dart';
import 'package:guide_me/features/dashboard/domain/use_case/decline_booking_use_case.dart';
import 'package:injectable/injectable.dart';

part 'accept_booking_state.dart';
@injectable
class AcceptBookingCubit extends Cubit<AcceptBookingState> {
  final AcceptBookingUseCase acceptBookingUseCase;
  final DeclineBookingUseCase declineBookingUseCase; // UseCase جديد للرفض
  AcceptBookingCubit(this.acceptBookingUseCase, this.declineBookingUseCase) : super(AcceptBookingInitial());
  void safeEmit(AcceptBookingState state) {
    if (!isClosed) emit(state);
  }

  Future<void> acceptBooking(String bookingId) async {
    safeEmit(AcceptBookingLoading());
    final result = await acceptBookingUseCase(bookingId);
  result.fold(
      (failure) => safeEmit(AcceptBookingFailure(failure.message.toString())),
      (_) => safeEmit(AcceptBookingSuccess(bookingId)),
    );
  } 
  
  // جوه AcceptBookingCubit
Future<void> declineBooking(String bookingId) async {
  safeEmit(AcceptBookingLoading()); 
  
  final result = await declineBookingUseCase(bookingId); // الـ UseCase بتاع الرفض

  result.fold(
    (failure) => safeEmit(AcceptBookingFailure(failure.message.toString())),
    (_) => safeEmit(DeclineBookingSuccess(bookingId)), 
  );
}
}
