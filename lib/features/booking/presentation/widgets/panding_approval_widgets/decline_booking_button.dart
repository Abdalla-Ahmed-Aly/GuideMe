import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/request_cancel_the_trip.dart';

class DeclineBookingButton extends StatelessWidget {
  const DeclineBookingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: 48,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xffEE3434)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(50),
          ),
          padding: const EdgeInsets.symmetric(vertical: 13),
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const RequestCancelTheTrip();
            },
          );
        },
        child: Text(
          context.l10n.declineBooking,
          style: TextStyle(
            fontSize: 16.fs,
            color: const Color(0xffEE3434),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
