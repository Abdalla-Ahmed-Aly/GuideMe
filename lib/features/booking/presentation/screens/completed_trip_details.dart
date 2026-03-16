import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/completed_trip_deatailes/completed_trip_screen_body.dart.dart';

class CompletedTripDetails extends StatelessWidget {
  const CompletedTripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primary2,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          context.l10n.details,
          style: AppTextStyles.poppinsBold24,
        ),
      ),
      body: const CompletedTripScreenBody(),
    );
  }
}
