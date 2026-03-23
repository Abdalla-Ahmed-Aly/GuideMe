part of 'select_nationality_cubit.dart';

class SelectNationalityData {
  List<NationalityEntity> nationalities;
  List<NationalityEntity> filteredNationalities;
  NationalityEntity? selectedNationality;
  String search;

  SelectNationalityData({
    required this.nationalities,
    this.filteredNationalities = const [],
    this.selectedNationality,
    this.search = '',
  });

  static SelectNationalityData initial() {
    final nationalities = AppCountries.countries
        .map(
          (e) => NationalityEntity(
            name: e["name"]!,
            code: e["code"]!,
            emoji: e["emoji"]!,
          ),
        )
        .toList();
    return SelectNationalityData(
      nationalities: nationalities,
      filteredNationalities: nationalities,
    );
  }

  SelectNationalityData copyWith({
    List<NationalityEntity>? nationalities,
    List<NationalityEntity>? filteredNationalities,
    NationalityEntity? selectedNationality,
    String? search,
  }) {
    return SelectNationalityData(
      nationalities: nationalities ?? this.nationalities,
      filteredNationalities:
          filteredNationalities ?? this.filteredNationalities,
      selectedNationality: selectedNationality ?? this.selectedNationality,
      search: search ?? this.search,
    );
  }
}

sealed class SelectNationalityState {
  final SelectNationalityData data;

  SelectNationalityState(this.data);

  SelectNationalityState copyWith(SelectNationalityData? data);
}

final class SelectNationalityInitial extends SelectNationalityState {
  SelectNationalityInitial(super.data);

  @override
  SelectNationalityState copyWith(SelectNationalityData? data) =>
      SelectNationalityInitial(data ?? this.data);
}

final class SelectNationalityLoading extends SelectNationalityState {
  SelectNationalityLoading(super.data);

  @override
  SelectNationalityState copyWith(SelectNationalityData? data) =>
      SelectNationalityLoading(data ?? this.data);
}

final class SelectNationalitySuccess extends SelectNationalityState {
  SelectNationalitySuccess(super.data);

  @override
  SelectNationalityState copyWith(SelectNationalityData? data) =>
      SelectNationalitySuccess(data ?? this.data);
}

final class SelectNationalityFailure extends SelectNationalityState {
  final Failure failure;
  SelectNationalityFailure(super.data, this.failure);

  @override
  SelectNationalityState copyWith(SelectNationalityData? data) =>
      SelectNationalityFailure(data ?? this.data, failure);
}
