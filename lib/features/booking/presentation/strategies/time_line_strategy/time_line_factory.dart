import 'package:guide_me/features/booking/presentation/strategies/time_line_strategy/completed_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/time_line_strategy/finished_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/time_line_strategy/live_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/time_line_strategy/pending_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/time_line_strategy/time_line_strategy.dart';

class TimeLineFactory {
  static final _pending = PendingStrategy();
  static final _live = LiveStrategy();
  static final _completed = CompletedStrategy();
  static final _finished = FinishedStrategy();

  static TimelineStrategy getStrategy({
    required double progress,
    required int currentIndex,
    required int length,
  }) {
    final isLast = currentIndex == length - 1;

    if (progress >= 1) {
      return isLast ? _finished : _completed;
    }

    if (progress > 0.01) {
      return _live;
    }

    return isLast ? _finished : _pending;
  }
}
