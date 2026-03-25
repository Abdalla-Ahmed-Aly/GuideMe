class BookAiPackageRequest {
  final String packageId;
  final String date;
  final int persons;
  final String pickupLocation;

  BookAiPackageRequest({
    required this.packageId,
    required this.date,
    required this.persons,
    required this.pickupLocation,
  });

  Map<String, dynamic> toJson() => {
    "aiPackageId": packageId,
    "date": date,
    "persons": persons,
    "pickupLocation": pickupLocation,
  };
}
