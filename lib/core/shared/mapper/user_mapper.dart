import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/shared/enums/user_role.dart';
import 'package:guide_me/core/shared/mapper/city_mapper.dart';
import 'package:guide_me/core/shared/models/user_model.dart';
import 'package:guide_me/core/shared/mapper/availability_mapper.dart';
import 'package:guide_me/core/shared/mapper/certificate_mapper.dart';
import 'package:guide_me/core/shared/mapper/review_mapper.dart';

class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id ?? "unknown",
      name: model.name,
      email: model.email ?? "unknown",
      phone: model.phone,
      role: UserRole.fromString(model.role ?? "tourist"),
      bio: model.bio ?? "",
      nationality: model.nationality,
      location: model.location ?? "",
      lat: model.lat ?? 0,
      lng: model.lng ?? 0,
      photoUrl: model.photo?.url,
      availability: model.availability != null
          ? AvailabilityMapper.toEntity(model.availability!)
          : null,
      languages: model.languages ?? [],
      interests: model.interests ?? [],
      expertise: model.expertise ?? [],
      guideCities: model.guideCities != null ? model.guideCities!
          .map((e) => CityMapper.toEntity(e))
          .toList() : [],
      certificates: model.certificates != null ? model.certificates!
          .map((e) => CertificateMapper.toEntity(e))
          .toList() : [],
      reviews:
          model.reviews?.map((e) => ReviewMapper.toEntity(e)).toList() ?? [],
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
