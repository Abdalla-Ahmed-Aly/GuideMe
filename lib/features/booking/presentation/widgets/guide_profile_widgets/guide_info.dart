import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/certificate_list_view.dart';

import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/language_item.dart';

class GuideInfo extends StatelessWidget {
  const GuideInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.p),
          child: Text(
            context.l10n.contactInformation,
            style: AppTextStyles.interSemiBold20.copyWith(
              color: AppColors.black,
            ),
          ),
        ),

        const SizedBox(height: 16),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.p),
          child: Row(
            children: [
              SvgPicture.asset(
                AppIcons.phone1,
                width: 20,
                height: 20,
              ),

              const SizedBox(width: 6),
              Text(
                '+201112469245',
                style: AppTextStyles.interRegular18.copyWith(
                  color: const Color(0xffB59A64),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.p),
          child: Row(
            children: [
              SvgPicture.asset(
                AppIcons.email,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 6),

              Text(
                'abdelazezhtm@gmail.com',
                style: AppTextStyles.interRegular18.copyWith(
                  color: const Color(0xffB59A64),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.p),
          child: Text(
            context.l10n.professionalDetails,
            style: AppTextStyles.interSemiBold20,
          ),
        ),

        const SizedBox(height: 16),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.p),
          child: Row(
            children: [
              SvgPicture.asset(
                AppIcons.portal,
                height: 20,
                width: 20,
              ),

              const SizedBox(width: 16),

              Text(
                'License ID: EG-TG-7890',
                style: AppTextStyles.interRegular18.copyWith(
                  color: const Color(0xffB59A64),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        ///earth icon
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.p),
          child: Row(
            children: [
              SvgPicture.asset(
                AppIcons.earth,
                width: 20,
                height: 20,
              ),

              const SizedBox(width: 16),

              LanguageItem(text: context.l10n.arabic),

              Padding(
                padding: const EdgeInsets.only(right: 18, left: 18),
                child: LanguageItem(text: context.l10n.english),
              ),
              LanguageItem(text: context.l10n.french),
            ],
          ),
        ),

        SizedBox(height: size.height * 0.03),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.p),
          child: Text(
            context.l10n.certifications,
            style: AppTextStyles.interSemiBold20.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        const SizedBox(height: 18),
        const CertificateListView(),
        /// Certified Egyptologist part2
      ],
    );
  }
}

class CertificateItem extends StatelessWidget {
  const CertificateItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            AppIcons.diploma,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 14),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.certifiedEgyptologist,
                softWrap: true,
                style: AppTextStyles.interSemiBold16.copyWith(
                  color: AppColors.black,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                context.l10n.egyptian,
                style: AppTextStyles.interSemiBold12.copyWith(
                  color: const Color(0xffB59A64),
                ),
              ),

              const SizedBox(height: 6),

              Text(
                context.l10n.valid,
                style: AppTextStyles.interSemiBold12.copyWith(
                  color: AppColors.natural3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
