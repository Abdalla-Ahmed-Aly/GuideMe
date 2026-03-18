import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_package_widgets/package_images_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_package_widgets/package_summary_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_package_widgets/pick_meeting_point_location_tile.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_package_widgets/select_date_and_time_section.dart';

class BookPackageScreenBody extends StatelessWidget {
  const BookPackageScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.p, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PackageImagesSection(),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              context.l10n.locationCapital,
              style: AppTextStyles.poppinsSemiBold16.copyWith(
                color: const Color(0xff64748B),
              ),
            ),
          ),

          const SizedBox(height: 12),

          const PickMeetingPointLocationTile(),

          const SizedBox(height: 24),

          const SelectDateAndTimeSection(),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              context.l10n.summaryCapital,
              style: AppTextStyles.poppinsSemiBold16.copyWith(
                color: const Color(0xff64748B),
              ),
            ),
          ),

          const SizedBox(height: 12),

          const PackageSummarySection(),
        ],
      ),
    );
  }
}
