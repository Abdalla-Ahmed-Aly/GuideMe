import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/Pending_approval_badge.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/booking_request_card.dart';

class PandingApprovalBody extends StatelessWidget {
  const PandingApprovalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 34,
          ),
          Padding(
            padding: EdgeInsets.only(left: 31.p, top: 28.p),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: const Color(0xffFFE5BA).withValues(alpha: .2),
                border: Border.all(color: const Color(0XFFCF872F)),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  FontAwesomeIcons.xmark,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.l10n.bookingRequest,
                style: AppTextStyles.poppinsMedium18,
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.p),
                child: const PendingApprovalBadge(),
              ),
            ],
          ),
        const  SizedBox(height: 47,),
      const  BookingRequestCard(),
        ],
      ),
    );
  }
}

