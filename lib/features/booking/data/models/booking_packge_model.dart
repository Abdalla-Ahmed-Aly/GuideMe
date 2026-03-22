import 'package:guide_me/core/shared/models/place_info_model.dart';

class BookingPackgeModel {
  final num totalPrice;
  final List<PlaceInfoModel> places;

  BookingPackgeModel({
    required this.totalPrice,
    required this.places,
  });

  factory BookingPackgeModel.fromJson(Map<String, dynamic> json) =>
      BookingPackgeModel(
        totalPrice: json["totalPrice"],
        places: List<PlaceInfoModel>.from(
          json["places"].map((x) => PlaceInfoModel.fromJson(x)),
        ),
      );
}
