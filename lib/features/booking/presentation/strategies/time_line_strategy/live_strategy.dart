import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/constants/timeline_constants.dart';
import 'package:guide_me/features/booking/presentation/strategies/time_line_strategy/time_line_strategy.dart';
import 'package:guide_me/core/widgets/time_line_indicator.dart';

class LiveStrategy implements TimelineStrategy {
  @override
  Widget buildBottomIndicator() {
    // pending
    return TimeLineIndicator(
      backgroundColor: TimelineConstants.pendingIndicatorColor,
      borderColor: TimelineConstants.pendingIndicatorBorderColor,
      borderWidth: TimelineConstants.indicatorPendingBorderWidth,
    );
  }


  // live
  @override
  Widget buildLiveIndicator(double progress) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.topCenter,
        child: FractionallySizedBox(
          heightFactor: progress,
          child: Container(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            child: TimeLineIndicator(
              backgroundColor: TimelineConstants.liveIndicatorColor,
              borderColor: TimelineConstants.liveIndicatorBorderColor,
              child: SvgPicture.asset(AppIcons.signal),
            ),
          ),
        ),
      ),
    );
  }
}
