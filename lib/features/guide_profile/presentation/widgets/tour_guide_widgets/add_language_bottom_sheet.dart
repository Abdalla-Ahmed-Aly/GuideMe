import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/constants/spoken_languages_constants.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';

import '../../cubits/guide_profile_cubit/guide_profile_cubit.dart';

class AddLanguageBottomSheet extends StatefulWidget {
  const AddLanguageBottomSheet({
    super.key,
    required this.user,
  });
  final UserEntity user;

  @override
  State<AddLanguageBottomSheet> createState() => _AddLanguageBottomSheetState();
}

class _AddLanguageBottomSheetState extends State<AddLanguageBottomSheet> {
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GuideProfileCubit>();
    return SafeArea(
      child: Container(
        height: context.screenHeight * 0.5,
        padding: EdgeInsets.symmetric(horizontal: 24.p),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16),
                  Container(
                    width: 120,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Text(
              context.l10n.addLanguage,
              style: AppTextStyles.interBold18,
            ),

            const SizedBox(height: 28),

            Text(
              context.l10n.language,
              style: AppTextStyles.interSemiBold16,
            ),

            const SizedBox(height: 8),

            DropdownSearch<String>(
              items: (filter, _) {
                return SpokenLanguagesConstants.languages
                    .where(
                      (element) => !widget.user.languages.contains(element),
                    )
                    .toList();
              },
              onChanged: (language) {
                selectedLanguage = language;
              },
              decoratorProps: DropDownDecoratorProps(
                decoration: InputDecoration(
                  hintText: context.l10n.selectLanguage,
                ),
              ),

              suffixProps: DropdownSuffixProps(
                dropdownButtonProps: DropdownButtonProps(
                  iconOpened: SvgPicture.asset(AppIcons.arrowFilter),
                  iconClosed: SvgPicture.asset(AppIcons.arrowFilter),
                ),
              ),

              popupProps: PopupProps.menu(
                menuProps: MenuProps(
                  backgroundColor: Colors.white,
                  margin: const EdgeInsets.only(top: 8, bottom: 32),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const Spacer(),

            BlocConsumer<GuideProfileCubit, GuideProfileState>(
              listener: (context, state) {
                if (state is GuideProfileSuccess && cubit.isAddingLanguage) {
                  context.read<UserCubit>().updateUser(state.user);
                  cubit.isAddingLanguage = false;
                  context.showSuccessSnakbar(
                    message: context.l10n.languageAddedSuccessfully,
                  );
                  context.pop();
                } else if (state is GuideProfileFailure) {
                  final error = FailureUiMapper.map(
                    context: context,
                    failure: state.failure,
                  );
                  context.showErrorSnakbar(message: error.message);
                  context.pop();
                }
              },
              builder: (context, state) {
                return Center(
                  child: AppButton(
                    isLoading: state is GuideProfileLoading,
                    onPressed: () {
                      if (selectedLanguage != null) {
                        context.read<GuideProfileCubit>().addLanguage(
                          language: selectedLanguage!,
                          languages: widget.user.languages,
                          userId: widget.user.id,
                        );
                      }
                    },
                    text: context.l10n.addLanguage,
                    height: 48,
                    radius: 24,
                  ),
                );
              },
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
