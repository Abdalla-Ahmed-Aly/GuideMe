import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/booking/data/models/add_booking_request.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/domain/repos/booking_repo.dart';
import 'package:injectable/injectable.dart';

part 'add_booking_state.dart';

@injectable
class AddBookingCubit extends Cubit<AddBookingState> {
  AddBookingCubit(this._bookingRepo) : super(AddBookingInitial());
  final BookingRepo _bookingRepo;

  void safeEmit(AddBookingState state) {
    if (!isClosed) emit(state);
  }

  Future<void> addBooking({required AddBookingRequest addBookingRequest}) async {
    safeEmit(AddBookingLoading());
    final result = await _bookingRepo.addBooking(addBookingRequest: addBookingRequest);
    result.fold(
      (failure) => safeEmit(AddBookingError(failure)),
      (bookingEntity) => safeEmit(AddBookingSuccess(bookingEntity)),
    );
  }
}
