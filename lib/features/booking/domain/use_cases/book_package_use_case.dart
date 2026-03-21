import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/booking/data/models/book_package_response_model.dart';
import 'package:guide_me/features/booking/data/models/booking_package_request_model.dart';
import 'package:guide_me/features/booking/domain/repos/booking_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class BookPackageUseCase {
  final BookingRepo _repo;

  BookPackageUseCase(this._repo);

  Future<Either<Failure, BookPackageResponseModel>> call(
    BookingPackageRequestModel bookingPackageRequestModel,
  ) async {
    return await _repo.bookPackage(
      bookingPackageRequestModel: bookingPackageRequestModel,
    );
  }
}
