import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/booking/data/models/book_ai_package_request.dart';
import 'package:guide_me/features/booking/data/models/book_package_response_model.dart';
import 'package:guide_me/features/booking/domain/repos/booking_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BookAiPackageUseCase {
  final BookingRepo bookingRepo;
  BookAiPackageUseCase(this.bookingRepo);
  Future<Either<Failure, BookPackageResponseModel>> call({required BookAiPackageRequest bookAi}) async {
    return await bookingRepo.bookAiPackage(bookAi: bookAi);
  }
}
