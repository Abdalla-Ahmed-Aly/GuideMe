import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/guide_booking/presentation/cubits/guide_booking_action_cubit/guide_booking_actions_cubit.dart';

class EndTourButton extends StatelessWidget {
  const EndTourButton({
    super.key,
    required this.booking,
  });
  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    final guideBookingActionsCubit = context.read<GuideBookingActionsCubit>();
    return BlocBuilder<GuideBookingActionsCubit, GuideBookingActionsState>(
      builder: (context, state) {
        return AppButton(
          isLoading:
              state is GuideBookingActionsLoading &&
              state.bookingId == booking.id,
          onPressed: () {
            guideBookingActionsCubit.endTour(bookingId: booking.id);
          },
          text: context.l10n.endTour,
          backgroundColor: AppColors.primary2,
          height: 44,
          radius: 220,
        );
      },
    );
  }
}
