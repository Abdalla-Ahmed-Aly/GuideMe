import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/booking/domain/enums/guide_booking_status.dart';

part 'guide_booking_state.dart';

class GuideBookingCubit extends Cubit<GuideBookingState> {
  GuideBookingCubit() : super(GuideBookingState.initial());

  void changeGuideBookingStatus(GuideBookingStatus status) {
    emit(state.copyWith(guideBookingStatus: status));
  }

  void changeDate(DateTime? date) {
    emit(state.copyWith(selectedDate: date));
  }
}
