import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/requests_item_shimmer.dart';

class RequestsShimmerListView extends StatelessWidget {
  const RequestsShimmerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20.p,
      ),
      itemCount: 3,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: RequestsItemShimmer(),
      ),
    );
  }
}
