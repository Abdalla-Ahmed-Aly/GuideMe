import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/user_profile_tile.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/Availability_Status_Section.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/requests_Item.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.screenHeight * 0.05),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.p),
            child: UserProfileTile(
              onTap: () {
                context.push(AppRoutes.tourGuideProfileScreen);
              },
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: const AvailabilityStatusSection(),
          ),

          const SizedBox(height: 24),

          Padding(
            padding: EdgeInsets.only(left: 21.p, right: 15.p),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.l10n.newRequests,
                style: AppTextStyles.poppinsMedium16.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: EdgeInsets.only(left: 21.p, right: 15.p),
            child: const ListviewRequiestItem(),
          ),
        ],
      ),
    );
  }
}

class ListviewRequiestItem extends StatelessWidget {
  const ListviewRequiestItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 15),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GestureDetector(
            onTap: () {
              context.push(AppRoutes.bookingRequestScreen);
            },
            child: const RequestsItem(),
          ),
        );
      },
      itemCount: 12,
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xffFFA537)),
        image: const DecorationImage(
          image: AssetImage(AppImages.profileImageTest),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
