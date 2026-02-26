import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/dashboard/presentation/screens/widgets/booking_request_screen_widgets/booking_details_request_item.dart';

class BookingDetailsRequestSection extends StatelessWidget {
  const BookingDetailsRequestSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: BookingDetailsRequestItem(
                title: context.l10n.dateTIME,
                value: 'Oct 24, 2026',
                value1: '9:00 AM',
                pathicon: SvgPicture.asset(AppIcons.date, width: 18.w),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: BookingDetailsRequestItem(
                title: context.l10n.duration,
                value: '4 Hours',
                value1: 'Flexible end',
                pathicon: SvgPicture.asset(AppIcons.time, width: 18.w),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: BookingDetailsRequestItem(
                title: context.l10n.groupsize,
                value: '4 People',
                value1: 'Privet Group',
                pathicon: SvgPicture.asset(AppIcons.people, width: 18.w),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: BookingDetailsRequestItem(
                title: context.l10n.experience,
                value: 'Giza Pyramids',
                value1: 'History & Myths',
                pathicon: SvgPicture.asset(AppIcons.location, width: 18.w),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
