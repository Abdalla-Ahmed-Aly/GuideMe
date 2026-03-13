import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/Pending_approval_badge.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/booking_request_card.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/close_button.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/pending_screen_buttons.dart';

class PandingApprovalBody extends StatelessWidget {
  const PandingApprovalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(height: 60.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.p),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: context.screenHeight * 0.045),
                Text(
                  context.l10n.bookingRequest,
                  style: AppTextStyles.poppinsMedium18,
                ),
                const CloseButtonwidget(),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Center(
            child: PendingApprovalBadge(
              text: context.l10n.pendingApproval,
            ),
          ),

          const SizedBox(height: 40),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.p),
            child: const BookingRequestCard(),
          ),

          const SizedBox(height: 44),

          const PendingScreenButtons(),

          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
