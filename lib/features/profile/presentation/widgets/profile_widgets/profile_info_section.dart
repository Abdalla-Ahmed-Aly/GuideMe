import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/profile/presentation/widgets/profile_widgets/profile_image_section.dart';
import 'package:guide_me/features/profile/presentation/widgets/profile_widgets/profile_info_item.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserSuccess) {
          final user = state.user;
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 16),

                // Image
                ProfileImageSection(user: user),

                const SizedBox(height: 16),

                // Name
                Text(
                  user.name ?? context.l10n.addYourName,
                  style: AppTextStyles.poppinsSemiBold26,
                ),

                const SizedBox(height: 32),

                // Name
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.p),
                  child: ProfileInfoItem(
                    label: context.l10n.name,
                    value: user.name ?? context.l10n.addYourName,
                  ),
                ),

                const SizedBox(height: 14),

                // Email
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.p),
                  child: ProfileInfoItem(
                    label: context.l10n.email,
                    value: user.email,
                  ),
                ),

                const SizedBox(height: 14),

                // Phone Number
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.p),
                  child: ProfileInfoItem(
                    label: context.l10n.phone,
                    value: user.phone ?? context.l10n.addYourPhone,
                  ),
                ),

                const SizedBox(height: 12),
              ],
            ),
          );
        }
        return const SizedBox.shrink(); //TODO: Message here to update profile
      },
    );
  }
}

