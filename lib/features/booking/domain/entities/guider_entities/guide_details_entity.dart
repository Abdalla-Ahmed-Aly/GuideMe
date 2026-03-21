import 'package:guide_me/core/entities/city_entity.dart';
import 'package:guide_me/features/booking/domain/entities/guider_entities/availability_entity.dart';
import 'package:guide_me/features/booking/domain/entities/guider_entities/certificate_entity.dart';
import 'package:guide_me/features/booking/domain/entities/guider_entities/review_entity.dart';

class GuideDetailsEntity {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String bio;
  final String? nationality;
  final String location;
  final double lat;
  final double lng;
  final String photoUrl;
  final AvailabilityEntity availability;
  final List<String> languages;
  final List<String> interests;
  final List<String> expertise;
  final List<CityEntity> guideCities;
  final List<CertificateEntity> certificates;
  final List<ReviewEntity> reviews;
  final int completedTours;
  final int yearsOfExperience;
  final double hourlyRate;
  final String currency;
  final bool isOnline;
  final bool isVerified;
  final double totalEarnings;

  const GuideDetailsEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.bio,
    this.nationality,
    required this.location,
    required this.lat,
    required this.lng,
    required this.photoUrl,
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
    required this.totalEarnings,
  });
}
