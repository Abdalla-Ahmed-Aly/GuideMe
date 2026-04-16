import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:intl/intl.dart';

class TourDetailCard extends StatelessWidget {
  const TourDetailCard({
    super.key,
    required this.requestModel,
  });
  final RequestEntity requestModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xffF6F2EB),
        border: Border.all(color: const Color(0xffF6F2EB)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on_rounded,
                size: 20,
                color: AppColors.primary2,
              ),
              const SizedBox(width: 8),
              Text(
                requestModel.booking!.place.title,
                style: AppTextStyles.poppinsMedium14,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(
                Icons.access_time_filled_rounded,
                size: 20,
                color: AppColors.primary2,
              ),
              const SizedBox(width: 8),
              Text(
                DateFormat(
                  'MMM dd, yyyy',
                ).format(requestModel.booking!.bookingDate),
                style: AppTextStyles.poppinsRegular14.copyWith(
                  color: const Color(0xff936B24),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
