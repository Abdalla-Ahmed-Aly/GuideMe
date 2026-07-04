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
import 'package:guide_me/core/shared/models/city_model.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_state.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/get_cities/get_cities_cubit.dart';
import 'package:guide_me/features/guide_registration/data/sources/guide_registration_data_source.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:guide_me/core/di/injectable.dart';

class CitiesSelectorSection extends StatelessWidget {
  const CitiesSelectorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GuideRegistrationSharedCubit>();
    return BlocProvider(
      create: (context) => GetCitiesCubit(
        GuideRegistrationDataSource(getIt<ApiService>()),
      )..getCities(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.whereDoYouGuide,
            style: AppTextStyles.poppinsMedium16,
          ),

          SizedBox(
            height: (() {
              final state = context.watch<GuideRegistrationSharedCubit>().state;
              if (state is GuideRegistrationFormData && state.model.guideCities.isNotEmpty) {
                return 14.0;
              }
              return 0.0;
            })(),
          ),

          // selected cities
          BlocBuilder<GuideRegistrationSharedCubit, GuideRegistrationSharedState>(
            builder: (context, state) {
              return BlocBuilder<GetCitiesCubit, GetCitiesState>(
                builder: (context, citiesState) {
                  final selectedCityIds = state is GuideRegistrationFormData ? state.model.guideCities : <String>[];
                  
                  // Map IDs to names if cities are loaded
                  List<String> displayNames = [];
                  if (citiesState is GetCitiesSuccess) {
                    displayNames = selectedCityIds.map((id) {
                      final city = citiesState.cities.firstWhere(
                        (c) => c.id == id,
                        orElse: () => CityModel(
                          id: id,
                          name: id,
                          image: '',
                          isPopular: false,
                          updateAt: '',
                        ),
                      );
                      return city.name ?? id;
                    }).toList();
                  } else {
                    displayNames = selectedCityIds; // Fallback
                  }

                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: selectedCityIds.asMap().entries.map((entry) {
                      final idx = entry.key;
                      final id = entry.value;
                      final name = idx < displayNames.length ? displayNames[idx] : id;
                      
                      return Chip(
                        labelPadding: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.only(right: 6),
                        label: Text(name),
                        labelStyle: AppTextStyles.poppinsMedium16.copyWith(
                          color: const Color(0xffF2930D),
                        ),
                        deleteIcon: const Icon(
                          Icons.close,
                          color: Color(0xffF2930D),
                          size: 22,
                        ),
                        onDeleted: () {
                          cubit.removeCity(id);
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
              );
            },
          ),

          const SizedBox(height: 16),

          // DropDown
          BlocBuilder<GetCitiesCubit, GetCitiesState>(
            builder: (context, state) {
              final cities = state is GetCitiesSuccess ? state.cities : <CityModel>[];
              
              return DropdownSearch<CityModel>.multiSelection(
                items: (filter, _) => cities.where((c) => (c.name ?? '').toLowerCase().contains(filter.toLowerCase())).toList(),
                itemAsString: (CityModel city) => city.name ?? '',
                compareFn: (item, selectedItem) => item.id == selectedItem.id,
                selectedItems: (state is GetCitiesSuccess && cubit.state is GuideRegistrationFormData) ? 
                   cities.where((c) => (cubit.state as GuideRegistrationFormData).model.guideCities.contains(c.id)).toList() : [],

                decoratorProps: DropDownDecoratorProps(
                  baseStyle: AppTextStyles.poppinsMedium16,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    prefixIcon: Icon(Icons.map_outlined),
                  ),
                ),

                popupProps: PopupPropsMultiSelection.dialog(
                  dialogProps: const DialogProps(
                    backgroundColor: Colors.white,
                    contentPadding: EdgeInsets.all(8),
                  ),
                  checkBoxBuilder: (context, item, isDisabled, isSelected) {
                    return Checkbox(
                      value: isSelected,
                      onChanged: (value) {},
                      checkColor: Colors.white,
                      activeColor: AppColors.primary,
                    );
                  },
                  itemClickProps: const ClickProps(
                    splashColor: Colors.transparent,
                  ),
                  itemBuilder: (context, item, isDisabled, isSelected) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        item.name ?? '',
                        style: AppTextStyles.poppinsMedium16,
                      ),
                    );
                  },
                  showSelectedItems: false,
                  searchDelay: const Duration(milliseconds: 500),
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    style: AppTextStyles.poppinsMedium16,
                    decoration: InputDecoration(
                      hintText: context.l10n.searchForACity,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  scrollbarProps: const ScrollbarProps(
                    thumbColor: AppColors.primary,
                    trackRadius: Radius.circular(12),
                    radius: Radius.circular(12),
                  ),

                  validationBuilder: (context, items) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: AppButton(
                          height: 38,
                          width: 100.w,
                          onPressed: () {
                            final ids = items.map((e) => e.id ?? '').where((id) => id.isNotEmpty).toList();
                            cubit.addCities(ids);
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
                    context.l10n.selectMoreCities,
                    style: AppTextStyles.poppinsMedium16,
                  );
                },
                suffixProps: DropdownSuffixProps(
                  dropdownButtonProps: DropdownButtonProps(
                    iconOpened: SvgPicture.asset(AppIcons.arrowUp),
                    iconClosed: SvgPicture.asset(AppIcons.arrowDown),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
