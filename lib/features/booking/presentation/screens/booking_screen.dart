import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_widgets/tourist_booking_app_bar.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_widgets/tourist_booking_body.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          TouristBookingAppBar(),

          Expanded(
            child: BookingBody(),
          ),
        ],
      ),
    );
  }
}
