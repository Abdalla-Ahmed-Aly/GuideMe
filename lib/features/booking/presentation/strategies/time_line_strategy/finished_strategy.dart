import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_widgets/indicators.dart';
import 'package:guide_me/features/booking/presentation/strategies/time_line_strategy/time_line_strategy.dart';

class FinishedStrategy implements TimelineStrategy {
  @override
  Widget buildBottomIndicator() {
    return const FinishedPoint();
  }

  @override
  Widget buildLiveIndicator(double progress) {
    return const SizedBox();
  }
}
