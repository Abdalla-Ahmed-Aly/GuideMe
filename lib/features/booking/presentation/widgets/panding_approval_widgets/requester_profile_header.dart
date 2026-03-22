import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';

class RequesterProfileHeaderSection extends StatelessWidget {
  const RequesterProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingData = GoRouterState.of(context).extra as BookingEntity;
    final userData = bookingData.user;
    return Row(
      children: [
        // image
        Container(
          width: 48,
          height: 48,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xffFFA537),
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          child: CustomNetworkImage(imageUrl: userData.photo.url),
        ),

        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userData.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.poppinsMedium18,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                userData.location,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.poppinsRegular14.copyWith(
                  color: const Color(0xff7C6965),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
