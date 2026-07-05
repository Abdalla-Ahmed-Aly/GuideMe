import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/shared/args/chat_args.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/guide_booking/presentation/widgets/start_tour_button.dart';
import 'package:intl/intl.dart';

class GuideNextTripCard extends StatelessWidget {
  const GuideNextTripCard({super.key, required this.booking});
  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    final UserCubit userCubit = context.read<UserCubit>();
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.tripDetailsScreen, extra: booking);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black.withValues(alpha: .15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat(
                    "MMM dd, yyyy",
                  ).format(booking.bookingDate),
                  style: AppTextStyles.poppinsMedium16.copyWith(
                    color: Colors.black.withValues(alpha: .5),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: .7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    context.l10n.next,
                    style: AppTextStyles.poppinsMedium14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            // Place Title
            Text(
              booking.place.title,
              style: AppTextStyles.poppinsSemiBold18,
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: StartTourButton(booking: booking),
                ),

                const SizedBox(width: 12),

                GestureDetector(
                  onTap: () {
                    userCubit.loadUser();
                    final userState = userCubit.state;
                    if (userState is! UserSuccess) return;
                    final user = userState.user;
                    final args = ChatArgs(
                      conversationId: ChatArgs.generateConversationId(
                        guideId: user.id,
                        touristId: booking.user.id,
                      ),
                      bookingId: booking.id,
                      user: booking.user,
                    );
                    log(args.conversationId);
                    context.push(AppRoutes.chatScreen, extra: args);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xffFEF4E6),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.chat_outlined,
                      color: Color(0xffF2930D),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
