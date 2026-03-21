import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/failure_message_widget.dart';
import 'package:guide_me/features/booking/presentation/cubits/filter_cubit/filter_cubit.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_widgets/filter_screen_body.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_widgets/filter_shimmer_screen.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xffF8F6F6),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          context.l10n.filter,
          style: AppTextStyles.poppinsBold22,
        ),
        leadingWidth: 65,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: const Color(0xffE2E8F0),
          ),
        ),
      ),
      body: BlocBuilder<FilterCubit, FilterState>(
        builder: (context, state) {
          if (state is FilterCitiesSuccess || state.filters.citiesLoaded) {
            return const FilterScreenBody();
          } else if (state is FilterCitiesFailure) {
            return FailureMessageWidget(
              error: FailureUiMapper.map(
                context: context,
                failure: state.failure,
              ).message,
            );
          }
          return const FilterShimmerScreen();
        },
      ),
    );
  }
}
