import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/utils/app_validators.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';
import 'package:guide_me/features/profile/presentation/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:guide_me/features/profile/presentation/widgets/edit_profile_widgets/change_image_section.dart';
import 'package:guide_me/features/profile/presentation/widgets/edit_profile_widgets/save_changes_section.dart';
import 'package:guide_me/features/profile/presentation/widgets/edit_profile_widgets/update_user_location_section.dart';

class EditProfileSection extends StatefulWidget {
  const EditProfileSection({super.key});

  @override
  State<EditProfileSection> createState() => _EditProfileSectionState();
}

class _EditProfileSectionState extends State<EditProfileSection> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    final userState = context.read<UserCubit>().state;
    if (userState is! UserSuccess) return;
    final user = userState.user;
    context.read<UpdateProfileCubit>().init(user);
    nameController = TextEditingController(text: user.name);
    phoneController = TextEditingController(text: user.phone);
  }

  @override
  void dispose() {
    nameController.dispose();
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
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),

                    // Change Image
                    const Center(child: ChangeImageSection()),

                    const SizedBox(height: 18),

                    // Name
                    Center(
                      child: AnimatedBuilder(
                        animation: nameController,
                        builder: (context, child) {
                          return Text(
                            nameController.text,
                            style: AppTextStyles.poppinsSemiBold16,
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 22),

                    // Name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        context.l10n.name,
                        style: AppTextStyles.poppinsMedium16,
                      ),
                    ),

                    const SizedBox(height: 4),

                    CustomTextField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return null;
                        }
                        return AppValidators.name(value);
                      },
                      keyboardType: TextInputType.name,
                      hintText: context.l10n.name,
                    ),

                    const SizedBox(height: 16),

                    // Phone
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        context.l10n.phone,
                        style: AppTextStyles.poppinsMedium16,
                      ),
                    ),

                    const SizedBox(height: 4),

                    CustomTextField(
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return null;
                        }
                        return AppValidators.phone(value);
                      },
                      keyboardType: TextInputType.phone,
                      hintText: context.l10n.phone,
                    ),

                    const SizedBox(height: 16),

                    // Location
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        context.l10n.location,
                        style: AppTextStyles.poppinsMedium16,
                      ),
                    ),

                    const SizedBox(height: 4),

                    const UpdateUserLocationSection(),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(
                    top: 12,
                    bottom: MediaQuery.of(context).padding.bottom + 12,
                  ),
                  child: SaveChangesSection(
                    nameController: nameController,
                    phoneController: phoneController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
