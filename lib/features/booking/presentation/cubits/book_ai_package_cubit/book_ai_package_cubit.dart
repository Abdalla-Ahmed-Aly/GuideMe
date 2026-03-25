import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/features/booking/data/models/book_ai_package_request.dart';
import 'package:guide_me/features/booking/data/models/book_package_response_model.dart';
import 'package:guide_me/features/booking/domain/use_cases/book_ai_package_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

part 'book_ai_package_state.dart';

@injectable
class BookAiPackageCubit extends Cubit<BookAiPackageState> {
  BookAiPackageCubit(this._bookAiPackageUseCase)
    : super(BookAiPackageInitial(data: BookAiPackageData()));
  final BookAiPackageUseCase _bookAiPackageUseCase;

  void safeEmit(BookAiPackageState state) {
    if (!isClosed) emit(state);
  }

  Future<void> bookAiPackage() async {
    safeEmit(BookAiPackageLoading(data: state.data));

    final bookAi = BookAiPackageRequest(
      packageId: state.data.pacakgeId!,
      date: DateFormat("yyyy-MM-dd").format(state.data.date!),
      persons: state.data.numberOfPersons,
      pickupLocation: state.data.location!,
    );

    final result = await _bookAiPackageUseCase.call(bookAi: bookAi);

    result.fold(
      (failure) {
        safeEmit(BookAiPackageFailure(failure: failure, data: state.data));
      },
      (response) {
        safeEmit(
          BookAiPackageSuccess(
            data: state.data,
            bookPackageResponseModel: response,
          ),
        );
      },
    );
  }

  void setPacakgeId(String pacakgeId) =>
      safeEmit(state.copyWith(data: state.data.copyWith(pacakgeId: pacakgeId)));
  void setDate(DateTime date) =>
      safeEmit(state.copyWith(data: state.data.copyWith(date: date)));
  void setNumberOfPersons(int numberOfPersons) => safeEmit(
    state.copyWith(data: state.data.copyWith(numberOfPersons: numberOfPersons)),
  );
  void setLocation(String location) =>
      safeEmit(state.copyWith(data: state.data.copyWith(location: location)));

  bool validate(BuildContext context) {
    if (!state.data.pacakgeIdIsValid) {
      safeEmit(
        BookAiPackageFailure(
          failure: AppFailure(
            failureCode: FailureCode.validation,
            message: context.l10n.validationSelectPackage,
          ),
          data: state.data,
        ),
      );
      return false;
    } else if (!state.data.dateIsValid) {
      safeEmit(
        BookAiPackageFailure(
          failure: AppFailure(
            failureCode: FailureCode.validation,
            message: context.l10n.validationSelectDate,
          ),
          data: state.data,
        ),
      );
      return false;
    } else if (!state.data.locationIsValid) {
      safeEmit(
        BookAiPackageFailure(
          failure: AppFailure(
            failureCode: FailureCode.validation,
            message: context.l10n.validation_location_required,
          ),
          data: state.data,
        ),
      );
      return false;
    }

    return true;
  }

  void resetState() => safeEmit(BookAiPackageInitial(data: state.data));
}
