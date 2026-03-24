import 'package:guide_me/core/shared/entities/photo_entity.dart';

class UserInfoEntity {
  final String id;
  final String name;
  final String location;
  final double lat;
  final double long;
  final PhotoEntity? photo;

  const UserInfoEntity({
    required this.id,
    required this.name,
    required this.location,
    required this.lat,
    required this.long,
    required this.photo,
  });
}
