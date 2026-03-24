import 'package:dartz/dartz.dart';
import 'package:guide_me/core/shared/entities/city_entity.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/features/booking/data/models/add_booking_request.dart';
import 'package:guide_me/features/booking/data/models/book_package_response_model.dart';
import 'package:guide_me/features/booking/data/models/booking_package_request_model.dart';
import 'package:guide_me/features/booking/data/models/cancel_booking_response.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/domain/entities/booking_package_entity.dart';

abstract class BookingRepo {
  Future<Either<Failure, BookingEntity>> addBooking({
    required AddBookingRequest addBookingRequest,
  });
  Future<Either<Failure, CancelBookingResponse>> cancelBooking({
    required String bookingId,
  });
  Future<Either<Failure, List<BookingEntity>>> getBookings({
    required String? status,
    required String? date,
  });

  Future<Either<Failure, List<CityEntity>>> getCities();
  
  Future<Either<Failure, List<BookingPackageEntity>>> getSuggestionPackages({
    required String city,
    required double budget,
  });

  Future<Either<Failure, BookPackageResponseModel>> bookPackage({
    required BookingPackageRequestModel bookingPackageRequestModel,
  });

  Future<Either<Failure, UserEntity>> getGuideData({
    required String guideId,
  });
}
