import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/view_datails_of_tourguide_body/contact_information.dart';
import 'package:guide_me/features/booking/presentation/widgets/view_datails_of_tourguide_body/profile_avatar_with_status.dart';

class ViewDatailsOfTourguideBody extends StatefulWidget {
  const ViewDatailsOfTourguideBody({super.key});

  @override
  State<ViewDatailsOfTourguideBody> createState() =>
      _ViewDatailsOfTourguideBodyState();
}

class _ViewDatailsOfTourguideBodyState
    extends State<ViewDatailsOfTourguideBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          const ProfileAvatarWithStatus(),
          Padding(
            padding: EdgeInsets.only(top: 13.p),
            child: Text(
              context.l10n.experienced1,
              style: AppTextStyles.interMedium14.copyWith(
                color: AppColors.natural3,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.p),
            child: Text(
              context.l10n.guideCairo,
              style: AppTextStyles.interMedium14.copyWith(
                color: AppColors.natural3,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.p),
            child: SvgPicture.asset(AppIcons.rating),
          ),
          Padding(
            padding: EdgeInsets.only(right: 200.p, top: 18.p),
            child: Text(
              context.l10n.contactInformation,
              style: AppTextStyles.interSemiBold20.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          const ContactInformation(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
