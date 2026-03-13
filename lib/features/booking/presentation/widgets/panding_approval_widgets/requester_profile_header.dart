import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';

class RequesterProfileHeaderSection extends StatelessWidget {
  const RequesterProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingData = GoRouterState.of(context).extra as BookingEntity;
    final userData = bookingData.userInfo;
    return Row(
      children: [
        // const UserInfoHeader(),

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
          child: CustomNetworkImage(imageUrl: userData.photo),
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

class UserInfoHeader extends StatelessWidget {
  const UserInfoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
        ),

        Positioned(
          right: 0,
          bottom: 2,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
