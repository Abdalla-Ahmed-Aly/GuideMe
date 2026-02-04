import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/features/booking/presentation/widgets/custom_appbar.dart';
import 'package:guide_me/features/booking/presentation/widgets/view_datails_of_tourguide_body/view_datails_of_tourguide_body.dart';

class ViewDatailsOfTourguideScreen extends StatelessWidget {
  const ViewDatailsOfTourguideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            CustomAppbar(
              text: context.l10n.book,
            ),

            const Expanded(child: ViewDatailsOfTourguideBody()),
          ],
        ),
      ),
    );
  }
}
