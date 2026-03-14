import 'package:guide_me/core/entities/guider_entity.dart';
import 'package:guide_me/core/entities/place_entity.dart';
import 'package:guide_me/core/entities/user_entity.dart';
import 'package:guide_me/features/booking/domain/entities/booking_ui_state_entity.dart';

class BookingEntity {
  final String id;
  final UserEntity user;
  final PlaceEntity place;
  final GuiderEntity? guider;
  final DateTime startTime;
  final DateTime endTime;
  final int persons;
  final double totalPrice;
  final String status;
  final BookingUiStateEntity? uiState;

  const BookingEntity({
    required this.id,
    required this.user,
    required this.place,
    this.guider,
    required this.startTime,
    required this.endTime,
    required this.persons,
    required this.totalPrice,
    required this.status,
    required this.uiState,
  });
}