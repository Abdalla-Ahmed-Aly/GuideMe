import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';

import 'package:guide_me/features/booking/presentation/widgets/reservation_widgets/reservation_screen_body.dart';
import 'package:guide_me/features/booking/presentation/widgets/custom_appbar.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Column(
          children: [
            CustomAppbar(
              text: context.l10n.booking,
            ),

            const Expanded(child: ReservationScreenBody()),
          ],
        ),
      ),
    );
  }
}
