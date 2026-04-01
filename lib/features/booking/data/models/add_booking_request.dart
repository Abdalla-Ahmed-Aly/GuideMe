
class AddBookingRequest {
  final String placeId;
  final String date;
  final String persons;
  final String pickupLocation;
  final String notes;

  const AddBookingRequest({
    required this.placeId,
    required this.date,
    required this.persons,
    required this.pickupLocation,
    required this.notes,
  });

  Map<String, dynamic> toJson() => {
    'placeId': placeId,
    'date': date,
    'persons': persons,
    'pickupLocation': pickupLocation,
    'notes': notes,
  };
}