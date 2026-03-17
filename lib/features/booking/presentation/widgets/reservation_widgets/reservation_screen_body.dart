import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/data/models/add_booking_request.dart';
import 'package:guide_me/features/booking/presentation/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:guide_me/features/booking/presentation/widgets/reservation_widgets/date_time_pick_card.dart';
import 'package:guide_me/features/booking/presentation/widgets/reservation_widgets/notes_text_field.dart';
import 'package:guide_me/features/booking/presentation/widgets/reservation_widgets/pick_up_point_field.dart';
import 'package:guide_me/features/booking/presentation/widgets/reservation_widgets/people_slider.dart';

class ReservationScreenBody extends StatelessWidget {
  const ReservationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReservationCubit>();
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.02375),

          const Center(
            child: DateTimePickCard(),
          ),

          SizedBox(height: size.height * 0.04),

          Center(
            child: PickUpPointField(
              text: context.l10n.pickup,
              icon: Icons.access_time,
            ),
          ),

          const SizedBox(height: 22),
          const NotesTextField(),

          SizedBox(
            height: context.isPortrait
                ? size.height * 0.025
                : size.width * 0.025,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.p),
            child: Text(
              context.l10n.numberofperson,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: AppColors.natural6,
                fontSize: 16,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.p),
            child: const PeopleSlider(),
          ),

          SizedBox(height: size.height * 0.04),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.p),
            child: AppButton(
              onPressed: () {
                if (!cubit.isValidated(context)) {
                  context.showErrorSnakbar(
                    message: cubit.state.error!,
                  );
                  return;
                }

                final addBooking = AddBookingRequest(
                  placeId: cubit.state.placeId,
                  date: cubit.state.date,
                  time: cubit.state.timeFormatted,
                  pickupLocation: cubit.state.pickupLocation,
                  notes: cubit.state.notes,
                  persons: cubit.state.persons.toString(),
                );

                context.push(
                  AppRoutes.bookingConfirmationScreen,
                  extra: addBooking,
                );
              },
              text: context.l10n.apply,
              textStyle: AppTextStyles.interSemiBold18.copyWith(
                color: AppColors.white,
              ),
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
