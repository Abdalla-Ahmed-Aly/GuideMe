import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_widgets/apply_filter_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_widgets/filter_section.dart';

class FilterScreenBody extends StatelessWidget {
  const FilterScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: FilterSection(),
        ),
    
        SafeArea(
          child: ApplyFilterSection(),
        ),
      ],
    );
  }
}