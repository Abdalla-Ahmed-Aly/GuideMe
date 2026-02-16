import 'package:flutter/material.dart';

abstract class TimelineConstants {
  static const double indicatorSize = 30;
  static const double indicatorBorderWidth = 3;
  static const double indicatorPendingBorderWidth = 10;
  static const double progressLineWidth = 3;

  // Pending
  static const Color pendingIndicatorColor = Color(0xffC9C9C9);
  static final Color pendingIndicatorBorderColor = Colors.white.withValues(
    alpha: .7,
  );

  // Live
  static const Color liveIndicatorColor = Color(0xffF2930D);
  static const Color liveIndicatorBorderColor = Color(0xffF6D9AF);

  // Finished
  static const Color finishedIndicatorColor = Color(0xff009F00);
  static const Color finishedIndicatorBorderColor = Color(0xffC3F2BA);

  // Completed
  static const Color completedIndicatorColor = liveIndicatorColor;
  static const Color completedIndicatorBorderColor = liveIndicatorBorderColor;

  // Live in pending
  static const Color liveInPendingIndicatorColor = Color(0xff4E4E4E);
  static final Color liveInPendingIndicatorBorderColor = Colors.white
      .withValues(
        alpha: .7,
      );

  // Finished in pending
  static const Color finishedInPendingIndicatorColor = Color(0xff4E4E4E);
  static const Color finishedInPendingIndicatorBorderColor = Color(0xffEEEEEE);
}
