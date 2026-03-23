part of 'interests_cubit.dart';

class InterestsData {
  final List<CategoryEntity> categories;
  final List<String> selectedCategories;
  final bool categoriesLoaded;

  InterestsData({
    required this.categories,
    this.selectedCategories = const [],
    this.categoriesLoaded = false,
  });

  factory InterestsData.initial() {
    return InterestsData(
      categories: const [],
      selectedCategories: const [],
    );
  }

  InterestsData copyWith({
    List<CategoryEntity>? categories,
    List<String>? selectedCategories,
    bool? categoriesLoaded,
  }) {
    return InterestsData(
      categories: categories ?? this.categories,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      categoriesLoaded: categoriesLoaded ?? this.categoriesLoaded,
    );
  }
}

sealed class InterestsState {
  final InterestsData data;
  const InterestsState({required this.data});

  InterestsState copyWith({InterestsData? data});
}

final class InterestsInitial extends InterestsState {
  const InterestsInitial({required super.data});

  @override
  InterestsInitial copyWith({InterestsData? data}) {
    return InterestsInitial(data: data ?? this.data);
  }
}

final class GetInterestsLoading extends InterestsState {
  GetInterestsLoading({required super.data});

  @override
  GetInterestsLoading copyWith({InterestsData? data}) {
    return GetInterestsLoading(data: data ?? this.data);
  }
}

final class GetInterestsSuccess extends InterestsState {
  final List<CategoryEntity> categories;
  GetInterestsSuccess({required this.categories, required super.data});

  @override
  GetInterestsSuccess copyWith({InterestsData? data}) {
    return GetInterestsSuccess(data: data ?? this.data, categories: categories);
  }
}

final class GetInterestsFailure extends InterestsState {
  final Failure failure;

  GetInterestsFailure({required super.data, required this.failure});

  @override
  GetInterestsFailure copyWith({InterestsData? data}) {
    return GetInterestsFailure(data: data ?? this.data, failure: failure);
  }
}

final class AddInterestsLoading extends InterestsState {
  AddInterestsLoading({required super.data});

  @override
  AddInterestsLoading copyWith({InterestsData? data}) {
    return AddInterestsLoading(data: data ?? this.data);
  }
}

final class AddInterestsSuccess extends InterestsState {
  AddInterestsSuccess({required super.data});

  @override
  AddInterestsSuccess copyWith({InterestsData? data}) {
    return AddInterestsSuccess(data: data ?? this.data);
  }
}

final class AddInterestsFailure extends InterestsState {
  final Failure failure;

  AddInterestsFailure({required super.data, required this.failure});

  @override
  AddInterestsFailure copyWith({InterestsData? data}) {
    return AddInterestsFailure(data: data ?? this.data, failure: failure);
  }
}
