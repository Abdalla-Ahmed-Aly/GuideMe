import 'package:dartz/dartz.dart';
import 'package:guide_me/core/shared/entities/city_entity.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/shared/mapper/city_mapper.dart';
import 'package:guide_me/core/shared/mapper/user_mapper.dart';
import 'package:guide_me/features/booking/data/data_sources/remote/booking_remote_data_source.dart';
import 'package:guide_me/features/booking/data/mappers/booking_mapper.dart';
import 'package:guide_me/features/booking/data/mappers/booking_package_mapper.dart';
import 'package:guide_me/features/booking/data/models/add_booking_request.dart';
import 'package:guide_me/features/booking/data/models/book_ai_package_request.dart';
import 'package:guide_me/features/booking/data/models/book_package_response_model.dart';
import 'package:guide_me/features/booking/data/models/booking_package_request_model.dart';
import 'package:guide_me/features/booking/data/models/cancel_booking_response.dart';
import 'package:guide_me/features/booking/data/models/review_status_response.dart';
import 'package:guide_me/features/booking/data/models/review_trip_request.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/domain/entities/booking_package_entity.dart';
import 'package:guide_me/features/booking/domain/repos/booking_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BookingRepo)
class BookingRepoImpl implements BookingRepo {
  final BookingRemoteDataSource _remoteDataSource;

  const BookingRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, BookingEntity>> addBooking({
    required AddBookingRequest addBookingRequest,
  }) async {
    try {
      final response = await _remoteDataSource.addBooking(
        addBookingRequest: addBookingRequest,
      );
      return right(BookingMapper.toEntity(response));
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, CancelBookingResponse>> cancelBooking({
    required String bookingId,
  }) async {
    try {
      final response = await _remoteDataSource.cancelBooking(
        bookingId: bookingId,
      );
      return right(response);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getBookings({
    required String? status,
    required String? date,
  }) async {
    try {
      final response = await _remoteDataSource.getBookings(
        status: status,
        date: date,
      );
      return right(response.map((e) => BookingMapper.toEntity(e)).toList());
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<CityEntity>>> getCities() async {
    try {
      final response = await _remoteDataSource.getCities();
      return right(response.map((e) => CityMapper.toEntity(e)).toList());
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<BookingPackageEntity>>> getSuggestionPackages({
    required String city,
    required double budget,
  }) async {
    try {
      final response = await _remoteDataSource.getSuggestionPackages(
        city: city,
        budget: budget,
      );
      return right(
        response.map((e) => BookingPackageMapper.toEntity(e)).toList(),
      );
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, BookPackageResponseModel>> bookPackage({
    required BookingPackageRequestModel bookingPackageRequestModel,
  }) async {
    try {
      final response = await _remoteDataSource.bookPackage(
        bookingPackageRequestModel: bookingPackageRequestModel,
      );
      return right(response);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getGuideData({
    required String guideId,
  }) async {
    try {
      final response = await _remoteDataSource.getGuideData(guideId: guideId);
      return right(UserMapper.toEntity(response));
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, BookPackageResponseModel>> bookAiPackage({
    required BookAiPackageRequest bookAi,
  }) async {
    try {
      final response = await _remoteDataSource.bookAiPackage(bookAi: bookAi);
      return right(response);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, ReviewStatusResponse>> checkReviewStatus({
    required String bookingId,
  }) async {
    try {
      final response = await _remoteDataSource.checkReviewStatus(
        bookingId: bookingId,
      );
      return right(response);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> reviewTrip({
    required ReviewTripRequest request,
  }) async {
    try {
      await _remoteDataSource.reviewTrip(request: request);
      return right(null);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
