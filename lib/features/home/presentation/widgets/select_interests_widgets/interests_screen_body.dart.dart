import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/home/presentation/widgets/select_interests_widgets/applying_selected_interests.dart';
import 'package:guide_me/features/home/presentation/widgets/select_interests_widgets/interests_grid_bloc_builder.dart';

class InterestsScreenBody extends StatelessWidget {
  const InterestsScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: InterestsGridBlocBuilder(),
        ),

        const SizedBox(height: 8),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.p,
          ),
          child: const ApplyingSelectedInterests(),
        ),

        SizedBox(height: MediaQuery.of(context).viewPadding.bottom + 16),
      ],
    );
  }
}
