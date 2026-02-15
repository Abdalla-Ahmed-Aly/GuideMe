import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_widgets/indicators.dart';
import 'package:guide_me/features/booking/presentation/strategies/time_line_strategy/time_line_strategy.dart';

class LiveStrategy implements TimelineStrategy {
  @override
  Widget buildBottomIndicator() {
    return const PendingPoint();
  }

  @override
  Widget buildLiveIndicator(double progress) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.topCenter,
        child: FractionallySizedBox(
          // heightFactor: progress < 0.1 ? 0.1 : progress,
          heightFactor: progress,
          child: const Align(
            alignment: Alignment.bottomCenter,
            child: LiveIndicator(),
          ),
        ),
      ),
    );
  }
}
