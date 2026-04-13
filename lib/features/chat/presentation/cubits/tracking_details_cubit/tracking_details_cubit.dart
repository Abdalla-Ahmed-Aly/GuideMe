import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'tracking_details_state.dart';

@injectable
class TrackingDetailsCubit extends Cubit<TrackingDetailsState> {
  TrackingDetailsCubit() : super(TrackingDetailsState.initial());

  void showTrackingCard() {
    emit(state.copyWith(
      showTrakingDetials: true, 
    ));
  }

  void hideTrackingCard() {
    emit(state.copyWith(
      showTrakingDetials: false, 
    ));
  }
}
