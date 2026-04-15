import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import '../../cubits/guide_profile_cubit/guide_profile_cubit.dart';
import 'profile_certification_card.dart';
import 'profile_title_section.dart';

class ProfileCertificationsSection extends StatelessWidget {
  const ProfileCertificationsSection({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final guideProfileCubit = context.read<GuideProfileCubit>();
    return BlocBuilder<GuideProfileCubit, GuideProfileState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.p, vertical: 16),
          child: Column(
            children: [
              ProfileTitleSection(
                title: context.l10n.certifications,
                onAddPressed: () {
                  context.push(AppRoutes.addCertificationScreen, extra: user);
                },
                onEditPressed: () {
                  guideProfileCubit.toggleCertificationEditMode();
                },
                inEditMode: guideProfileCubit.certificationInEditMode,
              ),

              const SizedBox(height: 16),

              if (user.certificates.isEmpty)
                SizedBox(
                  height: 100,
                  child: Center(
                    child: Text(
                      context.l10n.noCertificationsYet,
                      style: AppTextStyles.interBold16.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: user.certificates.length,
                  itemBuilder: (context, index) => ProfileCertificationCard(
                    certification: user.certificates[index],
                    user: user,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
