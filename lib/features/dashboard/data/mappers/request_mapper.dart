import 'package:guide_me/features/booking/data/mappers/booking_mapper.dart';
import 'package:guide_me/features/dashboard/data/models/request_model.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';

class RequestMapper {
  static RequestEntity toEntity(RequestModel request) {
    return RequestEntity(
      type: request.type,
      packageId: request.packageId,
      bookings: request.bookings != null
          ? request.bookings!.map((e) => BookingMapper.toEntity(e)).toList()
          : [],
      booking: request.booking != null
          ? BookingMapper.toEntity(request.booking!)
          : null,
    );
  }
}
