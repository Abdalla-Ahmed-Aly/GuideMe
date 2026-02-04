import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/features/booking/presentation/widgets/custom_appbar.dart';
import 'package:guide_me/features/booking/presentation/widgets/tourist_booking_body/tourist_booking_body.dart';

class TouristBookingScreen extends StatelessWidget {
  const TouristBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            text: context.l10n.touristBookings,
          ),
      
          const Expanded(child: TouristBookingBody()),
        ],
      ),
    );
  }
}
