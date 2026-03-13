class BookingUserInfoEntity {
  final String name;
  final String photo;
  final String location;
  final double lat;
  final double long;

  const BookingUserInfoEntity({
    required this.name,
    required this.photo,
    required this.location,
    required this.lat,
    required this.long,
  });
}