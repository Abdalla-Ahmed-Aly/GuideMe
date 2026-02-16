import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/home/presentation/cubits/nav_bar_cubit/nav_bar_cubit.dart';

class BookingProfile extends StatelessWidget {
  const BookingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<NavBarCubit>().changeIndex(3);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: context.screenWidth * 0.12,
            width: context.screenWidth * 0.12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffFFA537),
              ),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImages.profileImageTest),
              ),
            ),
          ),

          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                context.l10n.welcome,
                style: AppTextStyles.poppinsMedium14.copyWith(
                  color: const Color(0xff936B24),
                ),
              ),
              Text(
                "Omar Yasser",
                style: AppTextStyles.poppinsRegular18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
