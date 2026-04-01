import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/shared/entities/place_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/data/models/add_booking_request.dart';
import 'package:guide_me/features/booking/presentation/args/book_place_args.dart';
import 'package:guide_me/features/booking/presentation/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:intl/intl.dart';

class ApplyBookingSection extends StatelessWidget {
  const ApplyBookingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final PlaceEntity place = GoRouterState.of(context).extra as PlaceEntity;
    final ReservationCubit reservationCubit = context.read<ReservationCubit>();
    return AppButton(
      onPressed: () {

        if (!reservationCubit.isValidated(context)) {
          context.showErrorSnakbar(
            message: reservationCubit.state.error!,
          );
          return;
        }

        final addBooking = AddBookingRequest(
          placeId: reservationCubit.state.placeId!,
          date: DateFormat('yyyy-MM-dd').format(reservationCubit.state.date!),
          // time: reservationCubit.state.timeFormatted,
          pickupLocation: reservationCubit.state.pickupLocation!,
          notes: reservationCubit.state.notes,
          persons: reservationCubit.state.persons.toString(),
        );

        context.push(
          AppRoutes.bookingConfirmationScreen,
          extra: BookPlaceArgs(
            place: place,
            addBookingRequest: addBooking,
          ),
        );
      },
      text: context.l10n.apply,
      textStyle: AppTextStyles.interSemiBold18.copyWith(
        color: AppColors.white,
      ),
    );
  }
}
