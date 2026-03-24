enum UserRole {
  tourist,
  guide;

  factory UserRole.fromString(String role) {
    switch (role) {
      case 'tourist':
        return UserRole.tourist;
      case 'guide':
        return UserRole.guide;
      default:
        throw Exception('Unknown role: $role');
    }
  }
}
