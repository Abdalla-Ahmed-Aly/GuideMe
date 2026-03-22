import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/booking/presentation/args/book_package_args.dart';
import 'package:guide_me/features/booking/presentation/widgets/package_booking_success_widgets/package_data_tile.dart';
import 'package:intl/intl.dart';

class PackageDataSection extends StatelessWidget {
  const PackageDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as BookPackageArgs;
    final booking = data.bookPackageResponseModel;
    final packageData = data.packageArgs;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary2.withValues(alpha: 0.05),
            blurRadius: 24,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          PackageDataTile(
            title: context.l10n.status,
            value: context.l10n.pending,
            icon: Icons.info_outline,
          ),

          const SizedBox(height: 24),

          PackageDataTile(
            title: context.l10n.guests,
            value: packageData.numberOfPersons.toString(),
            icon: Icons.person_outline,
          ),

          const SizedBox(height: 24),

          PackageDataTile(
            title: context.l10n.date,
            value: DateFormat("MMM dd, yyyy").format(booking.tripDate),
            icon: Icons.calendar_today_outlined,
          ),

          const SizedBox(height: 24),

          PackageDataTile(
            title: context.l10n.time,
            value: DateFormat("h:mm a").format(booking.tripDate),
            icon: Icons.access_time,
          ),
        ],
      ),
    );
  }
}
