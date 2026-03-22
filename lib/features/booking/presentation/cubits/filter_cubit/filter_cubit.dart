import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/shared/entities/city_entity.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/features/booking/domain/entities/booking_package_entity.dart';
import 'package:guide_me/features/booking/domain/repos/booking_repo.dart';
import 'package:injectable/injectable.dart';

part 'filter_state.dart';

@injectable
class FilterCubit extends Cubit<FilterState> {
  FilterCubit(this._bookingRepo) : super(FilterInitial());
  final BookingRepo _bookingRepo;

  void safeEmit(FilterState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getCities() async {
    safeEmit(FilterCitiesLoading(state.filters));
    final result = await _bookingRepo.getCities();
    result.fold(
      (failure) => safeEmit(FilterCitiesFailure(state.filters, failure)),
      (cities) => safeEmit(
        FilterCitiesSuccess(
          state.filters.copyWith(availableCities: cities, citiesLoaded: true),
        ),
      ),
    );
  }

  Future<void> getSuggestionPackages() async {
    safeEmit(FilterApplying(state.filters));
    final result = await _bookingRepo.getSuggestionPackages(
      city: state.filters.city!.id,
      budget: state.filters.priceRange.end,
    );
    result.fold(
      (failure) => safeEmit(FilterApplyFailure(state.filters, failure)),
      (packages) => safeEmit(FilterApplied(state.filters, packages)),
    );
  }

  void setPriceRange(RangeValues priceRange) {
    safeEmit(
      state.copyWith(filters: state.filters.copyWith(priceRange: priceRange)),
    );
  }

  void setCity(CityEntity city) {
    safeEmit(state.copyWith(filters: state.filters.copyWith(city: city)));
  }

  void setPersons(int persons) {
    safeEmit(state.copyWith(filters: state.filters.copyWith(persons: persons)));
  }

  bool validate(BuildContext context) {
    if (state.filters.city == null) {
      safeEmit(
        FilterApplyFailure(
          state.filters,
          AppFailure(
            failureCode: FailureCode.validation,
            message: context.l10n.validationCity,
          ),
        ),
      );
      return false;
    }
    return true;
  }

  void resetFailure() {
    if (state is! FilterApplyFailure && state is! FilterCitiesFailure) return;

    if (state.filters.citiesLoaded) {
      safeEmit(FilterCitiesSuccess(state.filters));
    } else {
      safeEmit(FilterInitial());
    }
  }

  void resetApplied() {
    if (state is! FilterApplied) return;
    safeEmit(FilterCitiesSuccess(state.filters));
  }
}
