import 'package:guide_me/core/shared/mapper/city_mapper.dart';
import 'package:guide_me/core/shared/mapper/availability_mapper.dart';
import 'package:guide_me/core/shared/mapper/certificate_mapper.dart';
import 'package:guide_me/core/shared/mapper/review_mapper.dart';
import 'package:guide_me/core/shared/models/guide_details_model.dart';
import 'package:guide_me/core/shared/entities/guide_details_entity.dart';

class GuideDetailsMapper {
  static GuideDetailsEntity toEntity(GuideDetailsModel model) {
    return GuideDetailsEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      phone: model.phone,
      bio: model.bio,
      nationality: model.nationality,
      location: model.location,
      lat: model.lat,
      lng: model.lng,
      photoUrl: model.photo.url,
      availability: AvailabilityMapper.toEntity(model.availability),
      languages: model.languages,
      interests: model.interests,
      expertise: model.expertise,
      guideCities: model.guideCities.map((e) => CityMapper.toEntity(e)).toList(),
      certificates: model.certificates.map((e) => CertificateMapper.toEntity(e)).toList(),
      reviews: model.reviews?.map((e) => ReviewMapper.toEntity(e)).toList() ?? [],
      completedTours: model.completedTours,
      yearsOfExperience: model.yearsOfExperience,
      hourlyRate: model.hourlyRate,
      currency: model.currency,
      isOnline: model.isOnline,
      isVerified: model.isVerified,
      totalEarnings: model.totalEarnings,
    );
  }
}