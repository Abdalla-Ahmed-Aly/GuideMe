import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/spoken_languages_cubit/spoken_languages_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/guide_expertise_widgets/add_language_dialog.dart';

class AddLanguage extends StatelessWidget {
  const AddLanguage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      backgroundColor: const Color(0xffF2F2F2),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.add,
            color: Colors.black,
            size: 22,
          ),
          const SizedBox(width: 4),
          Text(
            context.l10n.addLanguage,
            style: AppTextStyles.poppinsMedium16,
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xffF2F2F2), width: 2),
      ),
      selected: false,
      onSelected: (_) async {
        final cubit = context.read<SpokenLanguagesCubit>();
        final result = await showDialog<List<String>>(
          context: context,
          builder: (context) {
            return BlocProvider.value(
              value: cubit,
              child: const AddLanguageDialog(),
            );
          },
        );
        if (result != null) {
          cubit.addLanguages(result);
        }
      },
    );
  }
}
