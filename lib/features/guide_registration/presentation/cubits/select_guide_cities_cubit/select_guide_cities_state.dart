part of 'select_guide_cities_cubit.dart';

class SelectGuideCitiesState {
  final List<String> selectedCities;
  final List<String> allCities;

  SelectGuideCitiesState({
    required this.selectedCities,
    required this.allCities,
  });

  factory SelectGuideCitiesState.initial() {
    return SelectGuideCitiesState(
      selectedCities: [],
      allCities: TouristCitiesConstants.touristCities,
    );
  }

  SelectGuideCitiesState copyWith({
    List<String>? selectedCities,
    List<String>? allCities,
  }) {
    return SelectGuideCitiesState(
      selectedCities: selectedCities ?? this.selectedCities,
      allCities: allCities ?? this.allCities,
    );
  }
}

