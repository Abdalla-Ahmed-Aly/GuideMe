import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';
import 'package:guide_me/features/guide_profile/presentation/cubits/add_certification_cubit/add_certification_cubit.dart';
import 'package:intl/intl.dart';
import 'month_year_picker.dart';
import 'upload_certification_file.dart';

class AddCertificationForm extends StatefulWidget {
  const AddCertificationForm({
    super.key,
  });

  @override
  State<AddCertificationForm> createState() => _AddCertificationFormState();
}

class _AddCertificationFormState extends State<AddCertificationForm> {
  TextEditingController certificationNameCont = TextEditingController();
  TextEditingController organizationCont = TextEditingController();
  TextEditingController issueDateCont = TextEditingController();
  TextEditingController expireDateCont = TextEditingController();

  DateTime? issueDate;
  DateTime? expireDate;

  @override
  void dispose() {
    certificationNameCont.dispose();
    organizationCont.dispose();
    issueDateCont.dispose();
    expireDateCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddCertificationCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.p,
        vertical: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name
          Text.rich(
            TextSpan(
              text: context.l10n.certificationName,
              style: AppTextStyles.interSemiBold16,
              children: [
                TextSpan(
                  text: "*",
                  style: AppTextStyles.interSemiBold16.copyWith(
                    color: AppColors.primary2,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          CustomTextField(
            hintText: context.l10n.certificationNameHint,
            controller: certificationNameCont,
            onChanged: (value) {
              cubit.certificationName = value;
            },
          ),

          const SizedBox(height: 24),

          // Orgnization
          Text.rich(
            TextSpan(
              text: context.l10n.issuingOrganization,
              style: AppTextStyles.interSemiBold16,
              children: [
                TextSpan(
                  text: "*",
                  style: AppTextStyles.interSemiBold16.copyWith(
                    color: AppColors.primary2,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          CustomTextField(
            hintText: context.l10n.issuingOrganizationHint,
            controller: organizationCont,
            onChanged: (value) {
              cubit.certificationOrganization = value;
            },
          ),

          const SizedBox(height: 24),

          // issue date
          Text.rich(
            TextSpan(
              text: context.l10n.issueDate,
              style: AppTextStyles.interSemiBold16,
              children: [
                TextSpan(
                  text: "*",
                  style: AppTextStyles.interSemiBold16.copyWith(
                    color: AppColors.primary2,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          CustomTextField(
            controller: issueDateCont,
            hintText: context.l10n.dateFormatHint,
            suffixIcon: const Icon(
              Icons.calendar_today_outlined,
              color: Colors.black,
            ),
            readOnly: true,
            onTap: () async {
              issueDate = await showDialog<DateTime>(
                context: context,
                builder: (context) {
                  return const MonthYearPicker();
                },
              );
              if (issueDate != null) {
                setState(() {
                  issueDateCont.text = DateFormat("MM/yyyy").format(issueDate!);
                  cubit.certificationIssueDate = DateFormat(
                    "MM/yyyy",
                  ).format(issueDate!);
                });
              }
            },
          ),

          const SizedBox(height: 24),

          // expire date
          Text(
            context.l10n.expirationDateOptional,
            style: AppTextStyles.interSemiBold16,
          ),

          const SizedBox(height: 6),

          CustomTextField(
            controller: expireDateCont,
            keyboardType: TextInputType.datetime,
            hintText: context.l10n.dateFormatHint,
            suffixIcon: const Icon(
              Icons.calendar_today_outlined,
              color: Colors.black,
            ),
            readOnly: true,
            onTap: () async {
              expireDate = await showDialog<DateTime>(
                context: context,
                builder: (context) {
                  return const MonthYearPicker();
                },
              );
              if (expireDate != null) {
                setState(() {
                  expireDateCont.text = DateFormat("MM/yyyy").format(expireDate!);
                  cubit.certificationExpiryDate = DateFormat(
                    "MM/yyyy",
                  ).format(expireDate!);
                });
              }
            },
          ),

          const SizedBox(height: 24),

          Text.rich(
            TextSpan(
              text: context.l10n.uploadCertificate,
              style: AppTextStyles.interSemiBold16,
              children: [
                TextSpan(
                  text: "*",
                  style: AppTextStyles.interSemiBold16.copyWith(
                    color: AppColors.primary2,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          const UploadCertificationFile(),
        ],
      ),
    );
  }
}
