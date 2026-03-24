class AvailabilityEntity {
  final List<String> days;
  final String? from;
  final String? to;

  const AvailabilityEntity({
    required this.days,
    this.from,
    this.to,
  });
}
