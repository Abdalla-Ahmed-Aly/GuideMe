import 'package:guide_me/core/shared/models/city_model.dart';
import 'package:guide_me/core/shared/models/photo_model.dart';
import 'package:guide_me/core/shared/models/availability_model.dart';
import 'package:guide_me/core/shared/models/certificate_model.dart';
import 'package:guide_me/core/shared/models/review_model.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? role;
  final String? bio;
  final String? nationality;
  final String? location;
  final double? lat;
  final double? lng;
  final PhotoModel? photo;
  final AvailabilityModel? availability;
  final List<String>? languages;
  final List<String>? interests;
  final List<String>? expertise;
  final List<CityModel>? guideCities;
  final List<CertificateModel>? certificates;
  final List<ReviewModel>? reviews;
  final int? completedTours;
  final int? yearsOfExperience;
  final double? hourlyRate;
  final String? currency;
  final bool? isOnline;
  final bool? isVerified;
  final String? verificationStatus;
  final double? totalEarnings;
  final DateTime? createdAt;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
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

factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
  id: json['_id'] ?? json['id'], // ✅ مهم

  name: json['name'],
  email: json['email'],
  phone: json['phone'],
  role: json['role'],
  bio: json['bio'],
  nationality: json['nationality'],
  location: json['location'],

  lat: json['lat'] != null ? (json['lat'] as num).toDouble() : null,
  lng: json['long'] != null ? (json['long'] as num).toDouble() : null,

  photo: json['photo'] != null
      ? PhotoModel.fromJson(json['photo'])
      : null,

  availability: json['availability'] != null
      ? AvailabilityModel.fromJson(json['availability'])
      : null,

  // ✅ SAFE LISTS
  languages: json['languages'] != null
      ? List<String>.from(json['languages'])
      : [],

  interests: json['interests'] != null
      ? List<String>.from(json['interests'])
      : [],

  expertise: json['expertise'] != null
      ? List<String>.from(json['expertise'])
      : [],

  guideCities: json['guideCities'] != null
      ? (json['guideCities'] as List)
          .map((e) => CityModel.fromJson(e))
          .toList()
      : [],

  certificates: json['certificates'] != null
      ? (json['certificates'] as List)
          .map((e) => CertificateModel.fromJson(e))
          .toList()
      : [],

  reviews: json['reviews'] != null
      ? (json['reviews'] as List)
          .map((e) => ReviewModel.fromJson(e))
          .toList()
      : [],

  completedTours: json['completedTours'],
  yearsOfExperience: json['yearsOfExperience'],

  hourlyRate: json['hourlyRate'] != null
      ? (json['hourlyRate'] as num).toDouble()
      : null,

  currency: json['currency'],
  isOnline: json['isOnline'],
  isVerified: json['isVerified'],
  verificationStatus: json['verificationStatus'],

  totalEarnings: json['totalEarnings'] != null
      ? (json['totalEarnings'] as num).toDouble()
      : 0,

  createdAt: json['createdAt'] != null
      ? DateTime.parse(json['createdAt'])
      : null,
);
  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'email': email,
    'phone': phone,
    'role': role,
    'bio': bio,
    'nationality': nationality,
    'location': location,
    'lat': lat,
    'long': lng,
    'photo': photo?.toJson(),
    'availability': availability?.toJson(),
    'languages': languages,
    'interests': interests,
    'expertise': expertise,
    'guideCities': guideCities?.map((e) => e.toJson()).toList(),
    'certificates': certificates?.map((e) => e.toJson()).toList(),
    'reviews': reviews?.map((e) => e.toJson()).toList(),
    'completedTours': completedTours,
    'yearsOfExperience': yearsOfExperience,
    'hourlyRate': hourlyRate,
    'currency': currency,
    'isOnline': isOnline,
    'isVerified': isVerified,
    'verificationStatus': verificationStatus,
    'totalEarnings': totalEarnings,
    'createdAt': createdAt?.toIso8601String(),
  };
}
