part of 'book_package_cubit.dart';

class BookPackageData {
  final String? location;
  final DateTime? date;
  final TimeOfDay? time;

  BookPackageData({
    this.location,
    this.date,
    this.time,
  });

  BookPackageData copyWith({
    String? location,
    DateTime? date,
    TimeOfDay? time,
  }) {
    return BookPackageData(
      location: location ?? this.location,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  bool get dateIsValid =>
      date != null &&
      date!.isAfter(DateTime.now().subtract(const Duration(days: 1)));

  bool get timeIsValid {
    if (time == null || date == null) return false;

    final selectedDateTime = DateTime(
      date!.year,
      date!.month,
      date!.day,
      time!.hour,
      time!.minute,
    );

    return DateTime.now().isBefore(selectedDateTime);
  }

  bool get isAllDataFilled => location != null && dateIsValid && timeIsValid;
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
  BookPackageSuccess(super.data);

  @override
  BookPackageState copyWith({BookPackageData? data}) =>
      BookPackageSuccess(data ?? this.data);
}

final class BookPackageFailure extends BookPackageState {
  final Failure failure;
  BookPackageFailure(super.data, this.failure);

  @override
  BookPackageState copyWith({BookPackageData? data}) =>
      BookPackageFailure(data ?? this.data, failure);
}
