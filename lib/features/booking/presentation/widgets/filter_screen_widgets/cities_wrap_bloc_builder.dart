import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/cubits/filter_cubit/filter_cubit.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_widgets/cities_wrap_shimmer_loading.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_widgets/city_selection_wrap.dart';

class CitiesWrapBlocBuilder extends StatelessWidget {
  const CitiesWrapBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        if (state is FilterCitiesSuccess || state.filters.citiesLoaded) {
          return const CitySelectionWrap();
        } else if (state is FilterCitiesFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          return Text(
            error.message,
            style: AppTextStyles.interRegular16,
          );
        }

        return const CitiesWrapShimmerLoading();
      },
    );
  }
}
