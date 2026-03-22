import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/decline_booking_button.dart';
import 'package:guide_me/features/home/presentation/cubits/nav_bar_cubit/tourist_nav_bar_cubit.dart';

class PendingScreenButtons extends StatelessWidget {
  const PendingScreenButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.p),
          child: AppButton(
            onPressed: () {
              context.read<TouristNavBarCubit>().changeIndex(1);
              context.go(AppRoutes.touristNavigationBarScreen);
            },
            text: context.l10n.viewbooking,
            radius: 50,
            height: 48,
            backgroundColor: const Color(0xffF2930D),
          ),
        ),
        
        const SizedBox(height: 20),
        
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.p),
          child: const DeclineBookingButton(),
        ),
      ],
    );
  }
}
