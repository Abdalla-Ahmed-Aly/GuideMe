import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/features/booking/domain/services/time_line_progress_calculator.dart';
import 'package:guide_me/features/booking/presentation/strategies/time_line_strategy/time_line_factory.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_widgets/time_line_indicator.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({
    super.key,
    required this.length,
    required this.currentIndex,
    required this.startDate,
    required this.endDate,
  });
  final int length;
  final int currentIndex;
  final DateTime startDate;
  final DateTime endDate;

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  double progress = 0;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    final start = widget.startDate;
    final end = widget.endDate;
    progress = TimeLineProgressCalculator.calculateProgress(
      start,
      end,
      DateTime.now(),
    );

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final newProgress = TimeLineProgressCalculator.calculateProgress(
        start,
        end,
        DateTime.now(),
      );

      if ((newProgress - progress).abs() > 0.0) {
        setState(() {
          progress = newProgress;
        });
      }

      if (newProgress >= 1) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strategy = TimeLineFactory.getStrategy(
      progress: progress,
      currentIndex: widget.currentIndex,
      length: widget.length,
    );

    return SizedBox(
      width: 30,
      child: Stack(
        children: [
          // Base Line
          _buildBaseLine(),

          // Value
          _buildProgressValue(),

          // Live indicator in top after finished
          if ((progress >= 1) && widget.currentIndex == 0)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: TimeLineIndicator(
                backgroundColor: const Color(0xffF2930D),
                borderColor: const Color(0xffF6D9AF),
                child: SvgPicture.asset(AppIcons.signal),
              ),
            ),

          // Bottom indicator
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: strategy.buildBottomIndicator(),
          ),

          // Live indicator
          strategy.buildLiveIndicator(progress),
        ],
      ),
    );
  }

  Widget _buildProgressValue() {
    return Positioned.fill(
      child: FractionallySizedBox(
        alignment: Alignment.topCenter,
        heightFactor: progress,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 3,
            decoration: BoxDecoration(
              color: const Color(0xffF2930B),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBaseLine() {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          width: 3,
          height: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffF6D9AF),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
