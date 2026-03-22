class LocationModel {
  final String name;
  final double lat;
  final double lng;

  const LocationModel({
    required this.name,
    required this.lat,
    required this.lng,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    name: json['name'] as String,
    lat: (json['lat'] as num).toDouble(),
    lng: (json['lng'] as num).toDouble(),
  );
}
