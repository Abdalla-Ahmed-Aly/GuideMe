import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/select_guide_cities_cubit/select_guide_cities_cubit.dart';

class CitiesSelectorSection extends StatelessWidget {
  const CitiesSelectorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SelectGuideCitiesCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.whereDoYouGuide,
          style: AppTextStyles.poppinsMedium16,
        ),

        SizedBox(
          height:
              context
                  .watch<SelectGuideCitiesCubit>()
                  .state
                  .selectedCities
                  .isNotEmpty
              ? 14
              : 0,
        ),

        // selected cities
        BlocBuilder<SelectGuideCitiesCubit, SelectGuideCitiesState>(
          builder: (context, state) {
            return Wrap(
              spacing: 8,
              children: state.selectedCities.map((city) {
                return Chip(
                  labelPadding: const EdgeInsets.only(left: 20),
                  padding: const EdgeInsets.only(right: 6),
                  label: Text(city),
                  labelStyle: AppTextStyles.poppinsMedium16.copyWith(
                    color: const Color(0xffF2930D),
                  ),
                  deleteIcon: const Icon(
                    Icons.close,
                    color: Color(0xffF2930D),
                    size: 22,
                  ),
                  onDeleted: () {
                    cubit.removeCity(city);
                  },
                  backgroundColor: const Color(0xffFFDEB1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                      color: Color(0xffFB9100),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),

        const SizedBox(height: 16),

        // DropDown
        DropdownSearch<String>.multiSelection(
          items: (filter, _) => cubit.state.allCities,
          selectedItems: cubit.state.selectedCities,

          decoratorProps: DropDownDecoratorProps(
            baseStyle: AppTextStyles.poppinsMedium16,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
              prefixIcon: Icon(Icons.map_outlined),
            ),
          ),

          popupProps: PopupPropsMultiSelection.dialog(
            // Dialog props
            dialogProps: const DialogProps(
              backgroundColor: Colors.white,
              contentPadding: EdgeInsets.all(8),
            ),

            // menu props
            // menuProps: MenuProps(
            //   margin: const EdgeInsets.only(top: 8, bottom: 32),
            //   borderRadius: BorderRadius.circular(12),
            // ),
            // check box builder
            checkBoxBuilder: (context, item, isDisabled, isSelected) {
              return Checkbox(
                value: isSelected,
                onChanged: (value) {},
                checkColor: Colors.white,
                activeColor: AppColors.primary,
              );
            },
            // Item click props
            itemClickProps: const ClickProps(
              splashColor: Colors.transparent,
            ),
            itemBuilder: (context, item, isDisabled, isSelected) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  item,
                  style: AppTextStyles.poppinsMedium16,
                ),
              );
            },
            showSelectedItems: false,
            searchDelay: const Duration(milliseconds: 500),
            showSearchBox: true,
            // search field props
            searchFieldProps: TextFieldProps(
              style: AppTextStyles.poppinsMedium16,
              decoration: InputDecoration(
                hintText: "Search city...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            // scrollbar props
            scrollbarProps: const ScrollbarProps(
              thumbColor: AppColors.primary,
              trackRadius: Radius.circular(12),
              radius: Radius.circular(12),
            ),

            // Add button
            validationBuilder: (context, items) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AppButton(
                    height: 38,
                    width: 100.w,
                    onPressed: () {
                      cubit.addCities(items);
                      Navigator.pop(context);
                    },
                    text: context.l10n.add,
                  ),
                ),
              );
            },
          ),

          dropdownBuilder: (context, data) {
            return Text(
              "Select more cities...",
              style: AppTextStyles.poppinsMedium16,
            );
          },
          suffixProps: DropdownSuffixProps(
            dropdownButtonProps: DropdownButtonProps(
              iconOpened: SvgPicture.asset(AppIcons.arrowUp),
              iconClosed: SvgPicture.asset(AppIcons.arrowDown),
            ),
          ),
        ),
      ],
    );
  }
}
