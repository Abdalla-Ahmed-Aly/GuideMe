import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/booking/domain/enums/trip_status.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  DateTime? selectedDate = DateTime.now();
  TripStatus selectedStatus = TripStatus.live;

  void changeStatus(TripStatus status) {
    selectedStatus = status;
    emit(BookingChangeStatus());
  }

  void changeDate(DateTime? date) {
    selectedDate = date;
    emit(BookingChangeDate());
  }
}
