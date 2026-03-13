import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:injectable/injectable.dart';

part 'reservation_state.dart';

@injectable
class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationState.initial());

  void safeEmit(ReservationState state) {
    if (!isClosed) emit(state);
  }

  void setPlaceId(String placeId) => safeEmit(state.copyWith(placeId: placeId));

  void setDate(String date) => safeEmit(state.copyWith(date: date));

  void setTime(TimeOfDay time) => safeEmit(state.copyWith(time: time));

  void setPickupLocation(String pickupLocation) =>
      safeEmit(state.copyWith(pickupLocation: pickupLocation));

  void setNotes(String notes) => safeEmit(state.copyWith(notes: notes));

  void setPersons(int persons) => safeEmit(state.copyWith(persons: persons));

  bool isValidated(BuildContext context) {
    if (state.date.isEmpty) {
      emit(state.copyWith(error: context.l10n.validationSelectDate));
      return false;
    }
    if (state.pickupLocation.isEmpty) {
      emit(state.copyWith(error: context.l10n.validationEnterPickupLocation));
      return false;
    }
    if (state.notes.isEmpty) {
      emit(state.copyWith(error: context.l10n.validationEnterNotes));
      return false;
    }
    if (state.persons == 0) {
      emit(state.copyWith(error: context.l10n.validationSelectPersons));
      return false;
    }
    return true;
  }
}
