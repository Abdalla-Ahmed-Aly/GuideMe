import 'package:guide_me/core/mapper/guider_mapper.dart';
import 'package:guide_me/core/mapper/place_mapper.dart';
import 'package:guide_me/core/mapper/user_mapper.dart';
import 'package:guide_me/features/booking/data/mappers/booking_ui_state_mapper.dart';
import 'package:guide_me/features/booking/data/models/booking_model.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';

class BookingMapper {
  static BookingEntity toEntity(BookingModel bookingModel) {
    return BookingEntity(
      id: bookingModel.id,
      user: UserMapper.toEntity(bookingModel.user),
      place: PlaceMapper.toEntity(bookingModel.place),
      guider: bookingModel.guider != null
          ? GuiderMapper.toEntity(bookingModel.guider!)
          : null,
      startTime: bookingModel.startTime,
      endTime: bookingModel.endTime,
      persons: bookingModel.persons,
      totalPrice: bookingModel.totalPrice,
      status: bookingModel.status,
      uiState: bookingModel.uiState != null
          ? BookingUiStateMapper.toEntity(bookingModel.uiState!)
          : null,
    );
  }
}