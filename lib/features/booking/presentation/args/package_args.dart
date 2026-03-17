import 'package:guide_me/features/booking/domain/entities/booking_package_entity.dart';

class PackageArgs {
  final BookingPackageEntity package;
  final int numberOfPersons;

  PackageArgs({required this.package, required this.numberOfPersons});
}
