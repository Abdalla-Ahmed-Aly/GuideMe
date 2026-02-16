class TimeLineProgressCalculator {
  static double calculateProgress(DateTime start, DateTime end, DateTime now) {
    if (now.isBefore(start)) return 0.0;
    if (now.isAfter(end)) return 1.0;

    final totalDuration = end.difference(start).inSeconds;
    final passedDuration = now.difference(start).inSeconds;

    return passedDuration / totalDuration;
  }
}
