import 'package:guide_me/features/booking/data/models/booking_ui_state_model.dart';
import 'package:guide_me/features/booking/domain/entities/booking_ui_state_entity.dart';

class BookingUiStateMapper {
  static BookingUiStateEntity toEntity(BookingUiStateModel bookingUiStateModel) {
    return BookingUiStateEntity(
      isLiveNow: bookingUiStateModel.isLiveNow,
      isStartingSoon: bookingUiStateModel.isStartingSoon,
      isCompleted: bookingUiStateModel.isCompleted,
      isFuture: bookingUiStateModel.isFuture,
      hasGuider: bookingUiStateModel.hasGuider,
    );
  }
}