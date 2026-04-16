import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/package_request_item.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/requests_item.dart';

class RequestsListView extends StatelessWidget {
  const RequestsListView({
    super.key,
    required this.requests,
  });

  final List<RequestEntity> requests;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20.p,
      ),
      itemBuilder: (context, index) {
        if (requests[index].type == 'package') {
          return PackageRequestItem(request: requests[index]);
        }

        return RequestsItem(
          requestModel: requests[index],
        );
      },
      itemCount: requests.length,
    );
  }
}
