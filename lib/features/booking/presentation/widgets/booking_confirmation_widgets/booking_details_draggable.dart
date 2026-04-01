import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_confirmation_widgets/book_place_confirmation_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_confirmation_widgets/booking_place_details_section.dart';

class BookingDetailsDraggable extends StatelessWidget {
  const BookingDetailsDraggable({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 22.p),
      children: const [
        BookingPlaceDetailsSection(),

        BookPlaceConfirmationSection(),
      ],
    );
  }
}
