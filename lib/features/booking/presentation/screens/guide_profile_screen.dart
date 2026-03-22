import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';
import 'package:guide_me/features/booking/presentation/cubits/guide_data_cubit/guide_data_cubit.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/guide_data_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/guide_profile_shimmer_screen.dart';

class GuideProfileScreen extends StatelessWidget {
  const GuideProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 63,
        leading: const Padding(
          padding: EdgeInsets.all(8),
          child: ArrowBackButton(),
        ),
        leadingWidth: 80,
        title: Text(
          context.l10n.guideProfile,
          style: AppTextStyles.poppinsBold24,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFE0E0E0),
          ),
        ),
      ),
      body: BlocBuilder<GuideDataCubit, GuideDataState>(
        builder: (context, state) {
          if (state is GuideDataSuccess) {
            return GuideDataSection(guide: state.guide);
          } else if (state is GuideDataFailure) {
            final error = FailureUiMapper.map(
              context: context,
              failure: state.failure,
            );
            return Center(child: Text(error.message));
          }
          return const GuideProfileShimmerScreen();
        },
      ),
    );
  }
}
