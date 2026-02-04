import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_atour_body/listview_builder_book_atour.dart';

import 'package:guide_me/features/booking/presentation/widgets/custom_appbar.dart';

class BookAtourScreen extends StatelessWidget {
  const BookAtourScreen({super.key});

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
            
            const Expanded(child: ListviewBuilderBookAtour()),
          ],
        ),
      ),
    );
  }
}
