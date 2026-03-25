import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_ai_package_widgets/enter_number_of_persons_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_ai_package_widgets/package_image_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_ai_package_widgets/pickup_location_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_ai_package_widgets/select_date_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/package_booking_success_widgets/pacakge_total_price_section.dart';
import 'package:guide_me/features/home/domain/entity/package_entity.dart';

class EnterReservationDetailsSection extends StatelessWidget {
  const EnterReservationDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final package = GoRouterState.of(context).extra as PackageEntity;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PackageImageSection(package: package),

          const SizedBox(height: 28),

          Text(
            context.l10n.reservationsDetails,
            style: AppTextStyles.poppinsBold22,
          ),

          const SizedBox(height: 24),

          const SelectDateSection(),

          const SizedBox(height: 24),

          const EnterNumberOfPersonsSection(),

          const SizedBox(height: 24),

          const PickupLocationSection(),

          const SizedBox(height: 40),

          PackageTotalPriceSection(totalPrice: package.totalPrice.toDouble()),
        ],
      ),
    );
  }
}
