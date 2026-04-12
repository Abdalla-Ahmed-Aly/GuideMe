
import 'package:guide_me/core/shared/mapper/location_mapper.dart';
import 'package:guide_me/features/dashboard/data/models/Analysis_model/request_guide_model/booking_request_model.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';

class RequestCardMapper {
  static RequestCardEntity toEntity(BookingRequestModel booking) {
    return RequestCardEntity(
      userName: booking.user.name,
      userImage: booking.user.image,
      language: "English (UK)", 
      price: booking.totalPrice,
      priceType: "ESTIMATE",
      placeTitle: booking.place.title ?? "Unknown Place",
      date: booking.bookingDate,
      durationMinutes: booking.place.durationMinutes ?? 0,
      groupSize: booking.persons ,
      bookingid: booking.id,
      locationEntity:booking.place.location!= null ?  LocationMapper.toEntity(booking.place.location! ) : null
    );
  }
}