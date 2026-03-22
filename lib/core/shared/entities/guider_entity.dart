import 'package:guide_me/core/shared/entities/photo_entity.dart';

class GuiderEntity {
  final String id;
  final String name;
  final PhotoEntity photo;

  const GuiderEntity({
    required this.id,
    required this.name,
    required this.photo,
  });
}