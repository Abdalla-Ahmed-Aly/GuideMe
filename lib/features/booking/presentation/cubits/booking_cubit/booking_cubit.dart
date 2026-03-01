import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/booking/domain/enums/guide_trip_status.dart';
import 'package:guide_me/features/booking/domain/enums/tourist_trip_status.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingState.initial());

  void changeTouristTripStatus(TouristTripStatus status) {
    emit(state.copyWith(touristTirpStatus: status));
  }

  void changeGuideTripStatus(GuideTripStatus status) {
    emit(state.copyWith(guideTripStatus: status));
  }

  void changeDate(DateTime? date) {
    emit(state.copyWith(selectedDate: date));
  }
}
