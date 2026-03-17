import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_widgets/cities_wrap_bloc_builder.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_widgets/price_range_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_widgets/select_number_of_persons_section.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24.p),
      children: [
        const PriceRangeSection(),

        const SizedBox(height: 28),

        Text(
          context.l10n.city,
          style: AppTextStyles.poppinsBold20,
        ),

        const SizedBox(height: 12),

        const CitiesWrapBlocBuilder(),

        const SizedBox(height: 28),

        const SelectNumberOfPersonsSection(),

        const SizedBox(height: 8),
      ],
    );
  }
}
