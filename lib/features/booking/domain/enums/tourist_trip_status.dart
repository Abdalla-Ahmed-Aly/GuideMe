enum BookingStatus {
  pending,
  accepted,
  live,
  completed,
  cancelled;

  static BookingStatus fromString(String status) {
    return BookingStatus.values.firstWhere((e) => e.name == status);
  }
}
