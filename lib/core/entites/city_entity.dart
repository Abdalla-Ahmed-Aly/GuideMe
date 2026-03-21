class CityEntity {
  final String id;
  final String name;
  final String? image;
  final bool? isPopular;

  const CityEntity({
    required this.id,
    required this.name,
    this.image,
    this.isPopular,
  });
}
