import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/booking_request_screen_widgets/booking_details_request_item.dart';
import 'package:intl/intl.dart';

class BookingDetailsRequestSection extends StatelessWidget {
  const BookingDetailsRequestSection({
    super.key,
    required this.requestEntity,
  });
  final RequestEntity requestEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: BookingDetailsRequestItem(
                title: context.l10n.dateTIME,
                value: DateFormat(
                  'yyyy-MM-dd',
                ).format(requestEntity.booking!.bookingDate),
                value1: DateFormat(
                  'kk:mm',
                ).format(requestEntity.booking!.bookingDate),
                pathicon: SvgPicture.asset(AppIcons.date, width: 18.w),
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: BookingDetailsRequestItem(
                title: context.l10n.duration,
                value:
                    '${requestEntity.booking!.place.durationMinutes} ${context.l10n.minutes}',
                value1: context.l10n.flexibleend,
                pathicon: SvgPicture.asset(AppIcons.time, width: 18.w),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: BookingDetailsRequestItem(
                title: context.l10n.groupsize,
                value: requestEntity.booking!.persons.toString(),
                value1: context.l10n.privateGroup,
                pathicon: SvgPicture.asset(AppIcons.people, width: 18.w),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: BookingDetailsRequestItem(
                title: context.l10n.experience,
                value: requestEntity.booking!.place.title,
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
