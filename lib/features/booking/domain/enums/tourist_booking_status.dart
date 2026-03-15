enum TouristBookingStatus {
  pending,
  accepted,
  live,
  completed,
  cancelled;

  static TouristBookingStatus fromString(String status) {
    return TouristBookingStatus.values.firstWhere((e) => e.name == status);
  }
}
