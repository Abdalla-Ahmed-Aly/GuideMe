import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/chat/presentation/widgets/tracking_widgets/live_tracking_details_card.dart';
import 'package:guide_me/features/chat/presentation/widgets/tracking_widgets/tracking_user_details_tile.dart';

class TrackingDraggableSection extends StatefulWidget {
  const TrackingDraggableSection({
    super.key,
  });

  @override
  State<TrackingDraggableSection> createState() =>
      _TrackingDraggableSectionState();
}

class _TrackingDraggableSectionState extends State<TrackingDraggableSection> {
  final DraggableScrollableController sheetController =
      DraggableScrollableController();

  @override
  void dispose() {
    sheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: sheetController,
      initialChildSize: .35,
      minChildSize: .1,
      maxChildSize: .89,
      snap: true,
      snapSizes: const [0.1, .35, .5, .89],
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      Container(
                        width: 120,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),

                      Text(
                        "Tourist Tracking",
                        style: AppTextStyles.interBold22,
                      ),

                      const SizedBox(height: 12),

                      const TrackingUserDetailsTile(),

                      const SizedBox(height: 16),

                      const Divider(
                        color: Color(0xffEBEBEB),
                        height: 1,
                        thickness: 1,
                      ),

                      const SizedBox(height: 16),

                      LiveTrackingDetailsCard(
                        icon: Icons.location_on_outlined,
                        title: context.l10n.tripAddress,
                        value: "2972 Westheimer Rd. Santa Ana, Illinois 85486",
                      ),

                      const SizedBox(height: 16),

                      LiveTrackingDetailsCard(
                        icon: Icons.access_time_rounded,
                        title: context.l10n.arrivalTime,
                        value: "03:00PM (Max 20 min)",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
