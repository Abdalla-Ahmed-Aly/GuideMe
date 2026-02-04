import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

import 'package:guide_me/features/booking/presentation/widgets/view_datails_of_tourguide_body/language_item.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 28.p, bottom: 20.p),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.p),
                child: SvgPicture.asset(AppIcons.phone),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.p),
                child: Text(
                  '+201112469245',
                  style: AppTextStyles.interRegular18.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 28.p, bottom: 35.p),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.p),
                child: SvgPicture.asset(AppIcons.massageLight),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 5.p,
                ),
                child: Text(
                  'abdelazezhtm@gmail.com',
                  style: AppTextStyles.interRegular18.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 200.p,
            top: 18.p,
          ),
          child: Text(
            context.l10n.professionalDetails,
            style: AppTextStyles.interSemiBold20.copyWith(
              color: AppColors.black,
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: 28.p, top: 17.p),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.p),
                child: SvgPicture.asset(AppIcons.calendar),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 5.p,
                ),
                child: Text(
                  'License ID: EG-TG-7890',
                  style: AppTextStyles.interRegular18.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),

        ///eathicons
        Padding(
          padding: EdgeInsets.only(left: 28.p, top: 21.p),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.p),
                child: SvgPicture.asset(AppIcons.arcticonEearth),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.p),
                child: LanguageItem(text: context.l10n.arabic),
              ),

              Padding(
                padding: EdgeInsets.only(right: 18.p, left: 18.p),
                child: LanguageItem(text: context.l10n.english),
              ),
              LanguageItem(text: context.l10n.french),
            ],
          ),
        ),
        SizedBox(
          height: 30.p,
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 260.p,
            top: 18.p,
          ),
          child: Text(
            context.l10n.certifications,
            style: AppTextStyles.interSemiBold20.copyWith(
              color: AppColors.black,
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: 28.p, top: 15.p),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.p),
                child: SvgPicture.asset(AppIcons.calendar),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 80.p,
                    ),
                    child: Text(
                      context.l10n.certifiedEgyptologist,
                      style: AppTextStyles.interSemiBold16.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.p, left: 5.p),
                    child: Text(
                      context.l10n.egyptian,
                      style: AppTextStyles.interSemiBold12.copyWith(
                        color: AppColors.natural3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 9.p, right: 88.p, left: 5.p),
                    child: Text(
                      context.l10n.valid,
                      style: AppTextStyles.interSemiBold12.copyWith(
                        color: AppColors.natural3,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        /// Certified Egyptologist part2
        Padding(
          padding: EdgeInsets.only(left: 28.p, top: 38.p),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.p),
                child: SvgPicture.asset(AppIcons.calendar),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 80.p,
                    ),
                    child: Text(
                      context.l10n.certifiedEgyptologist,
                      style: AppTextStyles.interSemiBold16.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.p, left: 5.p),
                    child: Text(
                      context.l10n.egyptian,
                      style: AppTextStyles.interSemiBold12.copyWith(
                        color: AppColors.natural3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 9.p, right: 88.p, left: 5.p),
                    child: Text(
                      context.l10n.valid,
                      style: AppTextStyles.interSemiBold12.copyWith(
                        color: AppColors.natural3,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
