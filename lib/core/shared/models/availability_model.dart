class AvailabilityModel {
  final List<String> days;
  final String? from;
  final String? to;

  const AvailabilityModel({
    required this.days,
    required this.from,
    required this.to,
  });

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) =>
      AvailabilityModel(
        days: List<String>.from(json['days']),
        from: json['from'],
        to: json['to'],
      );
}
