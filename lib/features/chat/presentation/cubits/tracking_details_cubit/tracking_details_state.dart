part of 'tracking_details_cubit.dart';

class TrackingDetailsState {
  final bool showTrakingDetials;

  TrackingDetailsState({required this.showTrakingDetials});

  factory TrackingDetailsState.initial() {
    return TrackingDetailsState(showTrakingDetials: true);
  }

  TrackingDetailsState copyWith({
    bool? showTrakingDetials,
  }) {
    return TrackingDetailsState(
      showTrakingDetials: showTrakingDetials ?? this.showTrakingDetials,
    );
  }
}
