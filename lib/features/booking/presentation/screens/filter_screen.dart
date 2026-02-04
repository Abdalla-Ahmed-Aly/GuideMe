import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/features/booking/presentation/widgets/custom_appbar.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_body/filter_screen_body.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            CustomAppbar(
              text: context.l10n.filter,
            ),

            const Expanded(child: FilterScreenBody()),
          ],
        ),
      ),
    );
  }
}
