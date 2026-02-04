import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';
import 'package:guide_me/features/home/presentation/widgets/select_interests_widgets/interests_grid_view.dart';

class SelectInterestsScreen extends StatelessWidget {
  const SelectInterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.08),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.p),
            child: const ArrowBackButton(),
          ),

          SizedBox(height: size.height * 0.05),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.p),
            child: Text(
              context.l10n.selectYourInterests,
              style: AppTextStyles.poppinsBold30.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),

          SizedBox(height: size.height * 0.06),

          const Expanded(
            child: InterestsGridView(),
          ),
        ],
      ),
    );
  }
}
