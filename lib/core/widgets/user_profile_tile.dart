import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key, required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            final user = state.user;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: context.isPortrait
                      ? context.screenWidth * 0.12
                      : context.screenHeight * 0.12,
                  width: context.isPortrait
                      ? context.screenWidth * 0.12
                      : context.screenHeight * 0.12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xffFFA537),
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
                  child: user.photoUrl != null
                      ? CustomNetworkImage(imageUrl: user.photoUrl!)
                      : const Icon(
                          Icons.person_outline,
                          color: AppColors.primary2,
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
                      user.name ?? context.l10n.unknownUser,
                      style: AppTextStyles.poppinsRegular18,
                    ),
                  ],
                ),
              ],
            );
          }
          return const SizedBox.shrink(); //TODO: Message for complete profile data
        },
      ),
    );
  }
}
