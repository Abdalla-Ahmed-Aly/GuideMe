part of 'book_ai_package_cubit.dart';

class BookAiPackageData {
  final String? pacakgeId;
  final DateTime? date;
  final int numberOfPersons;
  final String? location;

  BookAiPackageData({
    this.pacakgeId,
    this.date,
    this.numberOfPersons = 1,
    this.location,
  });

  BookAiPackageData copyWith({
    String? pacakgeId,
    DateTime? date,
    int? numberOfPersons,
    String? location,
  }) {
    return BookAiPackageData(
      pacakgeId: pacakgeId ?? this.pacakgeId,
      date: date ?? this.date,
      numberOfPersons: numberOfPersons ?? this.numberOfPersons,
      location: location ?? this.location,
    );
  }

  bool get dateIsValid => date != null && date!.isAfter(DateTime.now());

  bool get locationIsValid => location != null && location!.isNotEmpty;

  bool get pacakgeIdIsValid => pacakgeId != null && pacakgeId!.isNotEmpty;
}

sealed class BookAiPackageState {
  final BookAiPackageData data;

  BookAiPackageState({required this.data});

  BookAiPackageState copyWith({BookAiPackageData? data});
}

final class BookAiPackageInitial extends BookAiPackageState {
  BookAiPackageInitial({required super.data});

  @override
  BookAiPackageState copyWith({BookAiPackageData? data}) =>
      BookAiPackageInitial(data: data ?? this.data);
}

final class BookAiPackageLoading extends BookAiPackageState {
  BookAiPackageLoading({required super.data});

  @override
  BookAiPackageState copyWith({BookAiPackageData? data}) =>
      BookAiPackageLoading(data: data ?? this.data);
}

final class BookAiPackageSuccess extends BookAiPackageState {
  final BookPackageResponseModel bookPackageResponseModel;
  BookAiPackageSuccess({
    required super.data,
    required this.bookPackageResponseModel,
  });

  @override
  BookAiPackageState copyWith({BookAiPackageData? data}) =>
      BookAiPackageSuccess(
        data: data ?? this.data,
        bookPackageResponseModel: bookPackageResponseModel,
      );
}

final class BookAiPackageFailure extends BookAiPackageState {
  final Failure failure;

  BookAiPackageFailure({required this.failure, required super.data});

  get message => null;

  @override
  BookAiPackageState copyWith({BookAiPackageData? data}) =>
      BookAiPackageFailure(failure: failure, data: data ?? this.data);
}
