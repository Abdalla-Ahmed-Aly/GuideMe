// features/guide/data/models/guide_details_model.dart
import 'package:guide_me/core/shared/models/city_model.dart';
import 'package:guide_me/core/shared/models/photo_model.dart';
import 'package:guide_me/features/booking/data/models/guider_models/availability_model.dart';
import 'package:guide_me/features/booking/data/models/guider_models/certificate_model.dart';
import 'package:guide_me/features/booking/data/models/guider_models/review_model.dart';

class GuideDetailsModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String bio;
  final String? nationality;
  final String location;
  final double lat;
  final double lng;
  final PhotoModel photo;
  final AvailabilityModel availability;
  final List<String> languages;
  final List<String> interests;
  final List<String> expertise;
  final List<CityModel> guideCities;
  final List<CertificateModel> certificates;
  final List<ReviewModel>? reviews;
  final int completedTours;
  final int yearsOfExperience;
  final double hourlyRate;
  final String currency;
  final bool isOnline;
  final bool isVerified;
  final String verificationStatus;
  final double totalEarnings;
  final DateTime createdAt;

  const GuideDetailsModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.bio,
    this.nationality,
    required this.location,
    required this.lat,
    required this.lng,
    required this.photo,
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
    required this.createdAt,
  });

  factory GuideDetailsModel.fromJson(Map<String, dynamic> json) =>
      GuideDetailsModel(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        bio: json['bio'],
        nationality: json['nationality'],
        location: json['location'],
        lat: (json['lat'] as num).toDouble(),
        lng: (json['long'] as num).toDouble(),
        photo: PhotoModel.fromJson(json['photo']),
        availability: AvailabilityModel.fromJson(json['availability']),
        languages: List<String>.from(json['languages']),
        interests: List<String>.from(json['interests']),
        expertise: List<String>.from(json['expertise']),
        guideCities: json['guideCities'] == null
            ? []
            : (json['guideCities'] as List)
                .map((e) => CityModel.fromJson(e))
                .toList(),
        certificates: (json['certificates'] as List)
            .map((e) => CertificateModel.fromJson(e))
            .toList(),
        reviews: (json['reviews'] as List)
            .map((e) => ReviewModel.fromJson(e))
            .toList(),
        completedTours: json['completedTours'],
        yearsOfExperience: json['yearsOfExperience'],
        hourlyRate: (json['hourlyRate'] as num).toDouble(),
        currency: json['currency'],
        isOnline: json['isOnline'],
        isVerified: json['isVerified'],
        verificationStatus: json['verificationStatus'],
        totalEarnings: (json['totalEarnings'] as num).toDouble(),
        createdAt: DateTime.parse(json['createdAt']),
      );
}