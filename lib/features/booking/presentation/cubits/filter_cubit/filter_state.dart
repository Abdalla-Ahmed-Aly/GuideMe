part of 'filter_cubit.dart';

class FilterFilters {
  final List<CityEntity> availableCities;
  final bool citiesLoaded;
  final RangeValues priceRange;
  final CityEntity? city;
  final int persons;

  FilterFilters({
    this.availableCities = const [],
    this.citiesLoaded = false,
    this.priceRange = const RangeValues(0, 1000),
    this.city,
    this.persons = 1,
  });

  FilterFilters copyWith({
    List<CityEntity>? availableCities,
    bool? citiesLoaded,
    RangeValues? priceRange,
    CityEntity? city,
    int? persons,
  }) {
    return FilterFilters(
      availableCities: availableCities ?? this.availableCities,
      citiesLoaded: citiesLoaded ?? this.citiesLoaded,
      priceRange: priceRange ?? this.priceRange,
      city: city ?? this.city,
      persons: persons ?? this.persons,
    );
  }
}

abstract class FilterState {
  final FilterFilters filters;
  FilterState(this.filters);

  FilterState copyWith({FilterFilters? filters});
}

final class FilterInitial extends FilterState {
  FilterInitial() : super(FilterFilters());

  @override
  FilterState copyWith({FilterFilters? filters}) => FilterInitial()..filters;
}

final class FilterCitiesLoading extends FilterState {
  FilterCitiesLoading(super.filters);

  @override
  FilterState copyWith({FilterFilters? filters}) =>
      FilterCitiesLoading(filters ?? this.filters);
}

final class FilterCitiesSuccess extends FilterState {
  FilterCitiesSuccess(super.filters);

  @override
  FilterState copyWith({FilterFilters? filters}) =>
      FilterCitiesSuccess(filters ?? this.filters);
}

final class FilterCitiesFailure extends FilterState {
  final Failure failure;
  FilterCitiesFailure(super.filters, this.failure);

  @override
  FilterState copyWith({FilterFilters? filters}) =>
      FilterCitiesFailure(filters ?? this.filters, failure);
}

final class FilterApplying extends FilterState {
  FilterApplying(super.filters);

  @override
  FilterState copyWith({FilterFilters? filters}) =>
      FilterApplying(filters ?? this.filters);
}

final class FilterApplied extends FilterState {
  final List<BookingPackageEntity> packages;
  FilterApplied(super.filters, this.packages);

  @override
  FilterState copyWith({FilterFilters? filters}) =>
      FilterApplied(filters ?? this.filters, packages);
}

final class FilterApplyFailure extends FilterState {
  final Failure failure;
  FilterApplyFailure(super.filters, this.failure);

  @override
  FilterState copyWith({FilterFilters? filters}) =>
      FilterApplyFailure(filters ?? this.filters, failure);
}
