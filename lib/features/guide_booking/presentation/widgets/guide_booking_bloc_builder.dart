import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/failure_message_widget.dart';
import 'package:guide_me/features/booking/presentation/widgets/tourist_booking_widgets/booking_shimmer_list_view.dart';
import 'package:guide_me/features/guide_booking/presentation/cubits/guide_booking_cubit/guide_booking_cubit.dart';
import 'package:guide_me/features/guide_booking/presentation/widgets/guide_trip_list_view.dart';
import 'package:guide_me/features/guide_booking/presentation/cubits/guide_booking_action_cubit/guide_booking_actions_cubit.dart';
import 'package:guide_me/core/widgets/error_dailog.dart';
import 'package:guide_me/core/widgets/success_dialog.dart';

class GuideBookingBlocBuilder extends StatelessWidget {
  const GuideBookingBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GuideBookingActionsCubit, GuideBookingActionsState>(
      listener: (context, state) {
        if (state is GuideBookingStartSuccess) {
          showDialog(
            context: context,
            builder: (context) {
              return SuccessDialog(
                title: context.l10n.startTour,
                message: context.l10n.youveStartedThisTour,
              );
            },
          );
        } else if (state is GuideBookingEndSuccess) {
          showDialog(
            context: context,
            builder: (context) {
              return SuccessDialog(
                title: context.l10n.endTour,
                message: context.l10n.youveCompletedThisTour,
              );
            },
          );
        } else if (state is GuideBookingActionsFailure) {
          final error = FailureUiMapper.map(
            failure: state.failure,
            context: context,
          );
          showDialog(
            context: context,
            builder: (context) {
              return ErrorDialog(
                title: context.l10n.error,
                message: error.message,
              );
            },
          );
          context.read<GuideBookingActionsCubit>().resetState();
        }
      },
      child: BlocBuilder<GuideBookingCubit, GuideBookingState>(
        builder: (context, state) {
        if (state is GuideBookingFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          return FailureMessageWidget(error: error.message);
        } else if (state is GuideBookingSuccess) {
          if (state.guideBookings.isEmpty) {
            return Center(
              child: Text(
                context.l10n.noTripsYet,
                style: AppTextStyles.poppinsSemiBold18,
              ),
            );
          }
          return GuideTripListView(bookings: state.guideBookings);
        }
        return const BookingShimmerListView();
      },
      ),
    );
  }
}