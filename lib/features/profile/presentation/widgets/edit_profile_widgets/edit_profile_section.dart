import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/utils/app_validators.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';
import 'package:guide_me/features/profile/presentation/widgets/edit_profile_widgets/change_image_section.dart';

class EditProfileSection extends StatefulWidget {
  const EditProfileSection({super.key});

  @override
  State<EditProfileSection> createState() => _EditProfileSectionState();
}

class _EditProfileSectionState extends State<EditProfileSection> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: "John Doe");
    emailController = TextEditingController(text: "John Doe@gmail.com");
    phoneController = TextEditingController(text: "+1 (978) 804-4104");
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 38.p),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),

                  // Change Image
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ChangeImageSection(),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        nameController.text,
                        style: AppTextStyles.poppinsSemiBold16,
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  // Name
                  Text(
                    context.l10n.name,
                    style: AppTextStyles.poppinsMedium16,
                  ),

                  const SizedBox(height: 3),

                  CustomTextField(
                    controller: nameController,
                    validator: AppValidators.name,
                    keyboardType: TextInputType.name,
                    hintText: context.l10n.name,
                  ),

                  const SizedBox(height: 12),

                  // Email
                  Text(
                    context.l10n.email,
                    style: AppTextStyles.poppinsMedium16,
                  ),

                  const SizedBox(height: 3),

                  CustomTextField(
                    controller: emailController,
                    validator: AppValidators.email,
                    keyboardType: TextInputType.emailAddress,
                    hintText: context.l10n.email,
                  ),

                  const SizedBox(height: 12),

                  // Phone
                  Text(
                    context.l10n.phone,
                    style: AppTextStyles.poppinsMedium16,
                  ),

                  const SizedBox(height: 3),

                  CustomTextField(
                    controller: phoneController,
                    validator: AppValidators.phone,
                    keyboardType: TextInputType.phone,
                    hintText: context.l10n.phone,
                  ),

                  const SizedBox(height: 12),

                  // Location
                  Text(
                    context.l10n.location,
                    style: AppTextStyles.poppinsMedium16,
                  ),

                  const SizedBox(height: 3),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.natural2,
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.locationOutline),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Text(
                            "6 of october",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.interRegular16,
                          ),
                        ),

                        const SizedBox(width: 4),

                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 34),
                child: AppButton(
                  onPressed: () {
                    buildSuccessBottomSheet(context, size);
                  },
                  text: context.l10n.saveChanges,
                  textStyle: AppTextStyles.interSemiBold18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildSuccessBottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          left: false,
          right: false,
          top: false,
          child: SizedBox(
            height: size.height * 0.47,
            child: Column(
              children: [
                const SizedBox(height: 16),

                Container(
                  height: 6,
                  width: 146,
                  decoration: BoxDecoration(
                    color: const Color(0xff999999),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 8),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),

                        Image.asset(
                          AppImages.success,
                          height: context.isPortrait
                              ? size.height * 0.2
                              : size.width * 0.2,
                        ),

                        const SizedBox(height: 16),

                        Text(
                          context.l10n.successMsg,
                          style: AppTextStyles.interMedium30.copyWith(
                            color: const Color(0xff181F71),
                          ),
                        ),

                        const SizedBox(height: 28),

                        Text(
                          context.l10n.yourAccountSaved,
                          style: AppTextStyles.interMedium10.copyWith(
                            color: const Color(
                              0xff505050,
                            ).withValues(alpha: .5),
                          ),
                        ),

                        const SizedBox(height: 14),

                        Padding(
                          padding: EdgeInsets.only(
                            left: 50.p,
                            right: 50.p,
                          ),
                          child: AppButton(
                            onPressed: () {
                              context.pop();
                            },
                            text: context.l10n.confirmMsg,
                            textStyle: AppTextStyles.interSemiBold18,
                            radius: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
