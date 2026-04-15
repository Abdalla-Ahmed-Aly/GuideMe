import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/pacakge_request_widgets/package_place_details_item.dart';

class PackageItineraryListView extends StatelessWidget {
  const PackageItineraryListView({super.key, required this.request});
  final RequestEntity request;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 22.p),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: request.bookings?.length ?? 0,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
      itemBuilder: (context, index) {
        return PackagePlaceDetailsItem(
          booking: request.bookings![index],
          index: index,
        );
      },
    );
  }
}
