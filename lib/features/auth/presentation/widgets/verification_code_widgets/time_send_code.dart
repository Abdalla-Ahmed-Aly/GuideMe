import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class TimeSendCode extends StatefulWidget {
  final VoidCallback onResend;
  const TimeSendCode({super.key, required this.onResend});

  @override
  State<TimeSendCode> createState() => _TimeSendCodeState();
}

class _TimeSendCodeState extends State<TimeSendCode> {
  int totalSeconds = 30;
  Timer? timer;
 
  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (totalSeconds == 0) {
        t.cancel(); // call the function when finished
      } else {
        setState(() {
          totalSeconds--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8.p),
          child: Text(
            context.l10n.code,
            style: AppTextStyles.interRegular16.copyWith(
              color: AppColors.natural3,
            ),
          ),
        ),
        totalSeconds > 0
            ? Text(
                '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                style: AppTextStyles.interSemiBold16.copyWith(
                  color: AppColors.natural3,
                ),
              )
            : GestureDetector(
                onTap: () {
                  setState(() {
                    totalSeconds = 20;
                    startTimer();
                  });
                  widget.onResend();
                },
                child: Text(
                  context.l10n.resend,
                  style: AppTextStyles.interSemiBold16.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
      ],
    );
  }
}
