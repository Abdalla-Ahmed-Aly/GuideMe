import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/cubits/booking_cubit/booking_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/Schedule_working.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/work_hours_display.dart';

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
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: EdgeInsets.only(left: 21.p, right: 15.p),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppIcons.circle),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      context.l10n.workhours,
                      style: AppTextStyles.poppinsMedium16,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                const WorkHoursDisplay(),
                const SizedBox(
                  height: 28,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
