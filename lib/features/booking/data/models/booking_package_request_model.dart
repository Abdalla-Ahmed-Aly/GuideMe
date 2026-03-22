class BookingPackageRequestModel {
  final List<String> places;
  final String date;
  final int persons;
  final String pickupLocation;

  BookingPackageRequestModel({
    required this.places,
    required this.date,
    required this.persons,
    required this.pickupLocation,
  });

  Map<String, dynamic> toJson() => {
    "places": places,
    "date": date,
    "persons": persons,
    "pickupLocation": pickupLocation,
  };
}
