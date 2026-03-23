import 'package:guide_me/core/shared/models/guider_model.dart';
import 'package:guide_me/core/shared/models/place_model.dart';
import 'package:guide_me/core/shared/models/user_model.dart';
import 'package:guide_me/features/booking/data/models/booking_ui_state_model.dart';

class BookingModel {
  final String id;
  final String? packageId;
  final UserModel user;
  final PlaceModel place;
  final GuiderModel? guider;
  final DateTime startTime;
  final DateTime endTime;
  final int persons;
  final double totalPrice;
  final String status;
  final BookingUiStateModel? uiState;

  const BookingModel({
    required this.id,
    this.packageId,
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

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    id: json['_id'] as String,
    packageId: json['packageId'] as String?,
    user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    place: PlaceModel.fromJson(json['place'] as Map<String, dynamic>),
    guider: json['guider'] != null
        ? GuiderModel.fromJson(json['guider'] as Map<String, dynamic>)
        : null,
    startTime: DateTime.parse(json['startTime'] as String),
    endTime: DateTime.parse(json['endTime'] as String),
    persons: json['persons'] as int,
    totalPrice: (json['totalPrice'] as num).toDouble(),
    status: json['status'] as String,
    uiState: json['ui_state'] != null
        ? BookingUiStateModel.fromJson(json['ui_state'] as Map<String, dynamic>)
        : null,
  );
}
