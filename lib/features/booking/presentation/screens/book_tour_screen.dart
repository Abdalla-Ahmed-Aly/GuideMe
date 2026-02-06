import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_tour_widgets/guide_info_list_view_builder.dart';

import 'package:guide_me/features/booking/presentation/widgets/custom_appbar.dart';

class BookTourScreen extends StatelessWidget {
  const BookTourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            text: context.l10n.book,
          ),

          const Expanded(child: GuideInfoListViewBuilder()),
        ],
      ),
    );
  }
}
