import 'package:guide_me/core/shared/entities/city_entity.dart';
import 'package:guide_me/core/shared/entities/national_id_images_entity.dart';
import 'package:guide_me/core/shared/entities/tour_guide_license_entity.dart';
import 'package:guide_me/core/shared/enums/user_role.dart';
import 'package:guide_me/core/shared/entities/availability_entity.dart';
import 'package:guide_me/core/shared/entities/certificate_entity.dart';
import 'package:guide_me/core/shared/entities/review_entity.dart';

class UserEntity {
  final String id;
  final String? name;
  final String email;
  final String? phone;
  final UserRole role;
  final String status;
  final String? bio;
  final String? nationality;
  final String? location;
  final double? lat;
  final double? lng;
  final String? photoUrl;
  final NationalIdImagesEntity? nationalIdImages;
  final TourGuideLicenseEntity? tourGuideLicense;
  final AvailabilityEntity? availability;
  final List<String> languages;
  final List<String> interests;
  final List<String> expertise;
  final List<CityEntity> guideCities;
  final List<CertificateEntity> certificates;
  final List<ReviewEntity> reviews;
  final int? completedTours;
  final int? yearsOfExperience;
  final double? hourlyRate;
  final String? currency;
  final bool? isOnline;
  final bool? isVerified;
  final String? verificationStatus;
  final double? totalEarnings;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.status,
    required this.bio,
    this.nationality,
    required this.location,
    required this.lat,
    required this.lng,
    required this.photoUrl,
    required this.nationalIdImages,
    required this.tourGuideLicense,
    required this.availability,
    required this.languages,
    required this.interests,
    required this.expertise,
    required this.guideCities,
    required this.certificates,
    required this.reviews,
    required this.completedTours,
    required this.yearsOfExperience,
    required this.hourlyRate,
    required this.currency,
    required this.isOnline,
    required this.isVerified,
    required this.verificationStatus,
    required this.totalEarnings,
  });
}
