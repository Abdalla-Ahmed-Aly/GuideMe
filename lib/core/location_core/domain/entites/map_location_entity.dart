class MapLocationEntity {
  final double lat;
  final double lng;
  final String? name;

  const MapLocationEntity({
    required this.lat,
    required this.lng,
    this.name,
  });

  MapLocationEntity copyWith({String? name}) {
    return MapLocationEntity(
      lat: lat,
      lng: lng,
      name: name ?? this.name,
    );
  }
}
