class BookingUiStateModel {
  final bool isLiveNow;
  final bool isStartingSoon;
  final bool isCompleted;
  final bool isFuture;
  final bool hasGuider;

  const BookingUiStateModel({
    required this.isLiveNow,
    required this.isStartingSoon,
    required this.isCompleted,
    required this.isFuture,
    required this.hasGuider,
  });

  factory BookingUiStateModel.fromJson(Map<String, dynamic> json) =>
      BookingUiStateModel(
        isLiveNow: json['isLiveNow'] as bool,
        isStartingSoon: json['isStartingSoon'] as bool,
        isCompleted: json['isCompleted'] as bool,
        isFuture: json['isFuture'] as bool,
        hasGuider: json['hasGuider'] as bool,
      );
}
