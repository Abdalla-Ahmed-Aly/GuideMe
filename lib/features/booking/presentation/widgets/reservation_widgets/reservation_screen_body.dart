import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/booking/presentation/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:guide_me/features/booking/presentation/widgets/reservation_widgets/apply_booking_section.dart';
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
          const SizedBox(height: 16),

          const Center(
            child: DateTimePickCard(),
          ),

          const SizedBox(height: 24),

          const PickUpPointField(),

          const SizedBox(height: 16),

          const NotesTextField(),

          const SizedBox(height: 24),

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

          const SizedBox(height: 32),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.p),
            child: const ApplyBookingSection(),
          ),

          SizedBox(height: MediaQuery.of(context).padding.bottom + 12),
        ],
      ),
    );
  }
}

