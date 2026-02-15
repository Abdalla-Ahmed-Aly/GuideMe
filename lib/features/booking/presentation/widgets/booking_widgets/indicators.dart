import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';

class LiveIndicator extends StatelessWidget {
  const LiveIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: const Color(0xffF2930D),
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xffF6D9AF),
          width: 3,
        ),
      ),
      child: SvgPicture.asset(
        AppIcons.signal,
      ),
    );
  }
}

class CompletedIndicator extends StatelessWidget {
  const CompletedIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: const Color(0xffF2930D),
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xffF6D9AF),
          width: 3,
        ),
      ),
    );
  }
}

class FinishedPoint extends StatelessWidget {
  const FinishedPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: const Color(0xff009F00),
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xffC3F2BA),
          width: 3,
        ),
      ),
    );
  }
}

class PendingPoint extends StatelessWidget {
  const PendingPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: const Color(0xffC9C9C9),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withValues(alpha: .7),
          width: 10,
        ),
      ),
    );
  }
}
