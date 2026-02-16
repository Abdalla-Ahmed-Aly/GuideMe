import 'package:flutter/material.dart';
import 'package:guide_me/core/constants/timeline_constants.dart';
import 'package:guide_me/features/booking/presentation/strategies/time_line_strategy/time_line_strategy.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_widgets/time_line_indicator.dart';

class PendingStrategy implements TimelineStrategy {
  @override
  Widget buildBottomIndicator() {
    // pending
    return TimeLineIndicator(
      backgroundColor: TimelineConstants.pendingIndicatorColor,
      borderColor: TimelineConstants.pendingIndicatorBorderColor,
      borderWidth: TimelineConstants.indicatorPendingBorderWidth,
    );
  }

  @override
  Widget buildLiveIndicator(double progress) {
    return const SizedBox();
  }
}
