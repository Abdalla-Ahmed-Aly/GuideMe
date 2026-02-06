import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/widgets/tourist_booking_widgets/tourist_booking_app_bar.dart';
import 'package:guide_me/features/booking/presentation/widgets/tourist_booking_widgets/tourist_booking_body.dart';

class TouristBookingScreen extends StatelessWidget {
  const TouristBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          TouristBookingAppBar(),

          Expanded(
            child: TouristBookingBody(),
          ),
        ],
      ),
    );
  }
}
