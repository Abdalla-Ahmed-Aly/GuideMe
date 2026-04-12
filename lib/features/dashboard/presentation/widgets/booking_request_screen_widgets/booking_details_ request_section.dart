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
    super.key, required this.requestEntity,
  });
final RequestCardEntity requestEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: BookingDetailsRequestItem(
                title: context.l10n.dateTIME,
                value: DateFormat('yyyy-MM-dd').format(requestEntity.date),
                value1: DateFormat('kk:mm').format(requestEntity.date),
                pathicon: SvgPicture.asset(AppIcons.date, width: 18.w),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: BookingDetailsRequestItem(
                title: context.l10n.duration,
                value: '${requestEntity.durationMinutes} Minutes',
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
                value: requestEntity.groupSize.toString(),
                value1: 'Private Group',
                pathicon: SvgPicture.asset(AppIcons.people, width: 18.w),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: BookingDetailsRequestItem(
                title: context.l10n.experience,
                value: requestEntity.placeTitle,
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
