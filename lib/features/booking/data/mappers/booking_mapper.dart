import 'package:guide_me/features/booking/data/models/booking_model.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';

class BookingMapper {
  static BookingEntity mapToEntity(BookingModel model) {
    return BookingEntity(
      id: model.id,
      user: model.user,
      place: model.place,
      startTime: DateTime.parse(model.startTime),
      endTime: DateTime.parse(model.endTime),
      persons: model.persons,
      totalPrice: model.totalPrice,
      status: model.status,
    );
  }
}