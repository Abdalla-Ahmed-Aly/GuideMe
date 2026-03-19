import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:injectable/injectable.dart';

part 'book_package_state.dart';

@injectable
class BookPackageCubit extends Cubit<BookPackageState> {
  BookPackageCubit() : super(BookPackageInitial());

  void safeEmit(BookPackageState state) {
    if (!isClosed) emit(state);
  }

  void pickLocation(String location) {
    safeEmit(state.copyWith(data: state.data.copyWith(location: location)));
  }

  void pickDate(DateTime date) {
    safeEmit(state.copyWith(data: state.data.copyWith(date: date)));
  }

  void pickTime(TimeOfDay time) {
    safeEmit(state.copyWith(data: state.data.copyWith(time: time)));
  }

  bool validate() {
    if (state.data.location == null) {
      safeEmit(
        BookPackageFailure(
          state.data,
          const AppFailure(
            failureCode: FailureCode.validation,
            message: "Location is required",
          ),
        ),
      );
      return false;
    }
    if (state.data.date == null) {
      safeEmit(
        BookPackageFailure(
          state.data,
          const AppFailure(
            failureCode: FailureCode.validation,
            message: "Date is required",
          ),
        ),
      );
      return false;
    }
    if (state.data.time == null) {
      safeEmit(
        BookPackageFailure(
          state.data,
          const AppFailure(
            failureCode: FailureCode.validation,
            message: "Time is required",
          ),
        ),
      );
      return false;
    }
    return true;
  }
}
