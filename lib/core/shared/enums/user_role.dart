import 'package:hive_ce/hive_ce.dart';

part 'user_role.g.dart';

@HiveType(typeId: 1)
enum UserRole {
  @HiveField(0) tourist,
  @HiveField(1) guide,
  @HiveField(2) admin;

  factory UserRole.fromString(String role) {
    switch (role) {
      case 'tourist':
        return UserRole.tourist;
      case 'guide':
        return UserRole.guide;
      case 'admin':
        return UserRole.admin;
      default:
        throw Exception('Unknown role: $role');
    }
  }
}
