import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/chat/presentation/cubits/tracking_details_cubit/tracking_details_cubit.dart';

class ChatTripDetailsCard extends StatelessWidget {
  const ChatTripDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        context.read<TrackingDetailsCubit>().hideTrackingCard();
      },
      key: const ValueKey('tracking_card'),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black.withValues(alpha: .1)),
        ),
        child: Row(
          children: [
            /// Location Icon
            Hero(
              tag: "tracking_details",
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xffFEF4E6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.explore,
                  color: const Color(0xffF2930D),
                  size: 26.ic,
                ),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tour to Giza",
                    style: AppTextStyles.poppinsSemiBold16,
                  ),
                  Text(
                    "Today, 10:00 AM",
                    style: AppTextStyles.poppinsLight14.copyWith(
                      color: const Color(0xff9C7A49),
                    ),
                  ),
                ],
              ),
            ),

            /// details button
            GestureDetector(
              onTap: () {
                context.push(AppRoutes.trackingScreen);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffFEF4E6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  context.l10n.details,
                  style: AppTextStyles.poppinsSemiBold14.copyWith(
                    color: const Color(0xff9C7A49),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
