import 'package:flutter/material.dart';

abstract class TimelineStrategy {
  Widget buildBottomIndicator();
  Widget buildLiveIndicator(double progress);
}

