import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';

class AddCertificationScreenBody extends StatelessWidget {
  const AddCertificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.p,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.certificationName,
                        style: AppTextStyles.interSemiBold16,
                      ),

                      const SizedBox(height: 6),

                      CustomTextField(
                        hintText: context.l10n.certificationNameHint,
                      ),

                      const SizedBox(height: 16),

                      Text(
                        context.l10n.issuingOrganization,
                        style: AppTextStyles.interSemiBold16,
                      ),

                      const SizedBox(height: 6),

                      CustomTextField(
                        hintText: context.l10n.issuingOrganizationHint,
                      ),

                      const SizedBox(height: 16),

                      Text(
                        context.l10n.issueDate,
                        style: AppTextStyles.interSemiBold16,
                      ),

                      const SizedBox(height: 6),

                      CustomTextField(
                        hintText: context.l10n.dateFormatHint,
                      ),

                      const SizedBox(height: 16),

                      Text(
                        context.l10n.expirationDateOptional,
                        style: AppTextStyles.interSemiBold16,
                      ),

                      const SizedBox(height: 6),

                      CustomTextField(
                        hintText: context.l10n.dateFormatHint,
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    const SizedBox(height: 16),

                    const Divider(
                      color: AppColors.natural2,
                      height: 1,
                      thickness: 1,
                    ),

                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 16.p,
                          right: 16.p,
                          top: 16,
                          bottom: 8,
                        ),
                        child: AppButton(
                          text: context.l10n.addCertification,
                          onPressed: () {},
                          radius: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
