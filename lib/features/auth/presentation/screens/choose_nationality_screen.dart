import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';
import 'package:guide_me/features/auth/presentation/manager/select_nationality_cubit/select_nationality_cubit.dart';
import 'package:guide_me/features/auth/presentation/widgets/choose_nationality_widgets/applying_nationality_section.dart';
import 'package:guide_me/features/auth/presentation/widgets/choose_nationality_widgets/countries_list_view.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';

class ChooseNationalityScreen extends StatelessWidget {
  const ChooseNationalityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.08),

          Row(
            children: [
              30.horizontalSpace,
              const ArrowBackButton(),
            ],
          ),

          SizedBox(height: size.height * 0.05),

          Text(
            context.l10n.chooseNationality,
            style: AppTextStyles.poppinsBold30.copyWith(
              color: AppColors.primary500,
            ),
          ),

          28.verticalSpace,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.p),
            child: CustomTextField(
              hintText: context.l10n.search,
              suffixIcon: const Icon(
                Icons.search,
                color: AppColors.natural3,
              ),
              onChanged: (value) {
                context.read<SelectNationalityCubit>().search(value);
              },
            ),
          ),

          16.verticalSpace,

          SizedBox(
            height: 400.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.p),
              child: const CountriesListView(),
            ),
          ),

          70.verticalSpace,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.p),
            child: const ApplyingNationalitySection(),
          ),
        ],
      ),
    );
  }
}
