import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/presentation/cubits/cancel_booking_cubit/cancel_booking_cubit.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/cancel_booking_bottom_sheet.dart';

class DeclineBookingButton extends StatelessWidget {
  const DeclineBookingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        side: const BorderSide(color: Color(0xffEE3434)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50),
        ),
        padding: const EdgeInsets.symmetric(vertical: 13),
      ),
      onPressed: () {
        final booking = GoRouterState.of(context).extra as BookingEntity;
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return BlocProvider.value(
              value: context.read<CancelBookingCubit>(),
              child: CancelBookingBottomSheet(booking: booking),
            );
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
    );
  }
}
