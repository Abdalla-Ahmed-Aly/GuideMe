class BookingUiStateEntity {
  final bool isLiveNow;
  final bool isStartingSoon;
  final bool isCompleted;
  final bool isFuture;
  final bool hasGuider;

  const BookingUiStateEntity({
    required this.isLiveNow,
    required this.isStartingSoon,
    required this.isCompleted,
    required this.isFuture,
    required this.hasGuider,
  });
}
