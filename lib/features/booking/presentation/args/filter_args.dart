import 'package:guide_me/features/booking/domain/entities/booking_package_entity.dart';

class FilterArgs {
  final List<BookingPackageEntity> packages;
  final int numberOfPersons;

  FilterArgs({required this.packages, required this.numberOfPersons});
}
