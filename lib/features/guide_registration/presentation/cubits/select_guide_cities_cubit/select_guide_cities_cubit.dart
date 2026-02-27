import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/constants/tourist_cities_constants.dart';

part 'select_guide_cities_state.dart';

class SelectGuideCitiesCubit extends Cubit<SelectGuideCitiesState> {
  SelectGuideCitiesCubit() : super(SelectGuideCitiesState.initial());

  void addCities(List<String> cities) {
    final updated = {
      ...state.selectedCities,
      ...cities,
    }.toList();
    emit(
      state.copyWith(
        selectedCities: updated,
      ),
    );
  }

  void removeCity(String city) {
    final updated = List<String>.from(state.selectedCities)..remove(city);

    emit(
      state.copyWith(selectedCities: updated),
    );
  }

  void clearCities() {
    emit(SelectGuideCitiesState.initial());
  }

  List<String> getCities() {
    return state.allCities
        .where((city) => !state.selectedCities.contains(city))
        .toList();
  }
}
