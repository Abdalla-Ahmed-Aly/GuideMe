import 'package:guide_me/core/shared/entities/place_entity.dart';
import 'package:guide_me/features/booking/data/models/add_booking_request.dart';

class BookPlaceArgs {
  final PlaceEntity place;
  final AddBookingRequest addBookingRequest;

  BookPlaceArgs({required this.place, required this.addBookingRequest});
}
