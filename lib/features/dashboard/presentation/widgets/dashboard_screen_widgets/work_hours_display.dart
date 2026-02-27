
import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/shift_time_field.dart';
class WorkHoursDisplay extends StatelessWidget {
  const WorkHoursDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ShiftTimeField(
            time: '9:00 AM',
            width: 2,
            colorbackground: const Color(0xffF2930D).withValues(alpha: 0.1),
            colorborder: AppColors.primary,
            textcolor: AppColors.primary,
            time1: context.l10n.from,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: ShiftTimeField(
            time: '5:00 PM',
            width: 1,
            colorbackground: Colors.transparent,
            colorborder: const Color(0xffDEDEDE),
            textcolor: AppColors.primary,
            time1: context.l10n.to,
          ),
        ),
      ],
    );
  }
}
