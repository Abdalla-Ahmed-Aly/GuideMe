import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/Pending_approval_badge.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/booking_request_card.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/close_button.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/decline_booking_button.dart';
import 'package:guide_me/features/home/presentation/cubits/nav_bar_cubit/nav_bar_cubit.dart';

class PandingApprovalBody extends StatelessWidget {
  const PandingApprovalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            height: 60.h,
          ),
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
          const SizedBox(
            height: 24,
          ),
        const  Center(
            child:  PendingApprovalBadge(
              text: 'Pending Approval',
            ),
          ),
          const SizedBox(
            height: 47,
          ),
          const BookingRequestCard(),

          const SizedBox(height: 52),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.p),
            child: AppButton(
              onPressed: () {
                context.read<NavBarCubit>().changeIndex(1);
                context.go(AppRoutes.mainNavigationScreen);
              },
              text: context.l10n.viewbooking,
              radius: 50,

              backgroundColor: const Color(0xffF2930D),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.p),
            child: const DeclineBookingButton(),
          ),
          const SizedBox(
            height: 45,
          ),
        ],
      ),
    );
  }
}
