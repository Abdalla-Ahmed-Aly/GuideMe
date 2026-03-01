import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/strategies/time_line_strategy/time_line_strategy.dart';
import 'package:guide_me/core/constants/timeline_constants.dart';
import 'package:guide_me/core/widgets/time_line_indicator.dart';

class FinishedStrategy implements TimelineStrategy {
  @override
  Widget buildBottomIndicator() {
    // finished
    return const TimeLineIndicator(
      backgroundColor: TimelineConstants.finishedIndicatorColor,
      borderColor: TimelineConstants.finishedIndicatorBorderColor,
    );
  }

  @override
  Widget buildLiveIndicator(double progress) {
    return const SizedBox();
  }
}
