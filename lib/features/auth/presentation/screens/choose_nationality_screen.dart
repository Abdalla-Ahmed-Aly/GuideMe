import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';
import 'package:guide_me/features/auth/presentation/widgets/choose_nationality_widgets/countries_list_view.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';

class ChooseNationalityScreen extends StatefulWidget {
  const ChooseNationalityScreen({super.key});

  @override
  State<ChooseNationalityScreen> createState() =>
      _ChooseNationalityScreenState();
}

class _ChooseNationalityScreenState extends State<ChooseNationalityScreen> {
  List<String> countries = [
    "Egypt",
    "Italy",
    "France",
    "Germany",
    "Spain",
    "United States",
    "United Kingdom",
    "Canada",
    "Brazil",
    "Mexico",
    "Japan",
    "China",
    "India",
    "South Korea",
    "Australia",
    "Russia",
    "Turkey",
    "Saudi Arabia",
    "South Africa",
    "Argentina",
  ];

  List<String> filteredCountries = [];

  String value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          88.verticalSpace,

          Row(
            children: [
              30.horizontalSpace,
              const ArrowBackButton(),
            ],
          ),

          56.verticalSpace,

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
                setState(() {
                  this.value = value;
                  filteredCountries = countries
                      .where(
                        (country) =>
                            country.toLowerCase().contains(value.toLowerCase()),
                      )
                      .toList();
                });
              },
            ),
          ),

          17.verticalSpace,

          SizedBox(
            height: 400.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.p),
              child: CountriesListView(
                countries: filteredCountries.isEmpty && value.isEmpty
                    ? countries
                    : filteredCountries,
              ),
            ),
          ),

          70.verticalSpace,

          AppButton(
            onPressed: () {
              context.push(AppRoutes.allowLocationAccessScreen);
            },
            text: context.l10n.continueText,
            height: 54.h,
            width: 353.w,
          ),
        ],
      ),
    );
  }
}
