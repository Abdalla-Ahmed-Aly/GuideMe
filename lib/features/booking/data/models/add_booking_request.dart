
class AddBookingRequest {
  final String placeId;
  final String date;
  final String time;
  final String persons;
  final String pickupLocation;
  final String notes;

  const AddBookingRequest({
    required this.placeId,
    required this.date,
    required this.time,
    required this.persons,
    required this.pickupLocation,
    required this.notes,
  });

  Map<String, dynamic> toJson() => {
    'placeId': placeId,
    'date': date,
    'time': time,
    'persons': persons,
    'pickupLocation': pickupLocation,
    'notes': notes,
  };
}