part of 'book_package_cubit.dart';

class BookPackageData {
  final String? location;
  final DateTime? date;
  BookPackageData({
    this.location,
    this.date,
  });

  BookPackageData copyWith({
    String? location,
    DateTime? date,
  }) {
    return BookPackageData(
      location: location ?? this.location,
      date: date ?? this.date,
    );
  }

  String get formatDateTime {
    if (date == null) return "";
    return date!.toIso8601String().split('.').first;
  }

  bool get dateIsValid =>
      date != null &&
      date!.isAfter(DateTime.now().subtract(const Duration(days: 1)));

  bool get isAllDataFilled => location != null && dateIsValid;
}

sealed class BookPackageState {
  final BookPackageData data;

  BookPackageState(this.data);

  BookPackageState copyWith({BookPackageData? data});
}

final class BookPackageInitial extends BookPackageState {
  BookPackageInitial([BookPackageData? data])
    : super(data ?? BookPackageData());

  @override
  BookPackageState copyWith({BookPackageData? data}) =>
      BookPackageInitial(data ?? this.data);
}

final class BookPackageLoading extends BookPackageState {
  BookPackageLoading(super.data);

  @override
  BookPackageState copyWith({BookPackageData? data}) =>
      BookPackageLoading(data ?? this.data);
}

final class BookPackageSuccess extends BookPackageState {
  BookPackageSuccess(super.data, {required this.bookPackageResponseModel});
  final BookPackageResponseModel bookPackageResponseModel;

  @override
  BookPackageState copyWith({BookPackageData? data}) => BookPackageSuccess(
    data ?? this.data,
    bookPackageResponseModel: bookPackageResponseModel,
  );
}

final class BookPackageFailure extends BookPackageState {
  final Failure failure;
  BookPackageFailure(super.data, this.failure);

  @override
  BookPackageState copyWith({BookPackageData? data}) =>
      BookPackageFailure(data ?? this.data, failure);
}
