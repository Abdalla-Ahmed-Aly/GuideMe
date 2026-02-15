import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_widgets/indicators.dart';
import 'package:guide_me/features/booking/presentation/strategies/time_line_strategy/time_line_strategy.dart';

class CompletedStrategy implements TimelineStrategy {
  @override
  Widget buildBottomIndicator() {
    return const CompletedIndicator();
  }

  @override
  Widget buildLiveIndicator(double progress) {
    return const SizedBox();
  }
}
