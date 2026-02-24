import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/cubits/booking_cubit/booking_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/screens/widgets/dashboard_screen_widgets/Availability_Status_Section.dart';
import 'package:guide_me/features/dashboard/presentation/screens/widgets/dashboard_screen_widgets/Schedule_working.dart';
import 'package:guide_me/features/dashboard/presentation/screens/widgets/dashboard_screen_widgets/user_profile_header.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const UserProfileHeader(),
          const SizedBox(
            height: 26,
          ),
          Padding(
            padding: EdgeInsets.only(left: 21.p, right: 15.p),
            child: const AvailabilityStatusSection(),
          ),
          const SizedBox(
            height: 12,
          ),
          const WorkScheduleSection(),
        ],
      ),
    );
  }
}

class WorkScheduleSection extends StatelessWidget {
  const WorkScheduleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.only(left: 21.p, right: 12.p),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.weeklySchedule,
                style: AppTextStyles.poppinsMedium16,
              ),
              Text(
                context.l10n.selectdays,
                style: AppTextStyles.poppinsRegular14.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 21,
        ),
        BlocProvider(
          create: (context) => BookingCubit(),
          child: SizedBox(
            height: context.isPortrait
                ? context.screenHeight * .087
                : context.screenWidth * .087,
            child: const ScheduleWorking(),
          ),
        ),
      ],
    );
  }
}
