import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/features/booking/data/models/book_package_response_model.dart';
import 'package:guide_me/features/booking/data/models/booking_package_request_model.dart';
import 'package:guide_me/features/booking/domain/use_cases/book_package_use_case.dart';
import 'package:injectable/injectable.dart';

part 'book_package_state.dart';

@injectable
class BookPackageCubit extends Cubit<BookPackageState> {
  BookPackageCubit(this._bookPackageUseCase) : super(BookPackageInitial());
  final BookPackageUseCase _bookPackageUseCase;

  void safeEmit(BookPackageState state) {
    if (!isClosed) emit(state);
  }

  Future<void> bookPackage({required BookingPackageRequestModel bookingPackageRequestModel}) async {
    safeEmit(BookPackageLoading(state.data));

    final result = await _bookPackageUseCase(bookingPackageRequestModel);
    result.fold(
      (failure) => safeEmit(BookPackageFailure(state.data, failure)),
      (response) => safeEmit(BookPackageSuccess(state.data, bookPackageResponseModel: response)),
    );
  }

  void pickLocation(String location) {
    safeEmit(state.copyWith(data: state.data.copyWith(location: location)));
  }
  void pickDate(DateTime date) {
    safeEmit(state.copyWith(data: state.data.copyWith(date: date)));
  }
  // void pickTime(TimeOfDay time) {
  //   safeEmit(state.copyWith(data: state.data.copyWith(time: time)));
  // }

  bool validate(BuildContext context) {
    if (state.data.location == null) {
      safeEmit(
        BookPackageFailure(
          state.data,
          AppFailure(
            failureCode: FailureCode.validation,
            message: context.l10n.validation_location_required,
          ),
        ),
      );
      return false;
    }
    if (!state.data.dateIsValid) {
      safeEmit(
        BookPackageFailure(
          state.data,
          AppFailure(
            failureCode: FailureCode.validation,
            message: context.l10n.validation_date_past,
          ),
        ),
      );
      return false;
    }
    // if (!state.data.timeIsValid) {
    //   safeEmit(
    //     BookPackageFailure(
    //       state.data,
    //       AppFailure(
    //         failureCode: FailureCode.validation,
    //         message: context.l10n.validation_time_past,
    //       ),
    //     ),
    //   );
    //   return false;
    // }
    return true;
  }

  void resetValidation() {
    safeEmit(BookPackageInitial(state.data));
  }
}
