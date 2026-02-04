import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({super.key});

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  SfRangeValues _values = const SfRangeValues(200, 800);
  @override
  Widget build(BuildContext context) {
    //startThumbIcon
    final Widget startThumbIcon = Container(
      width: 55.w,
      height: 31.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.natural7, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1), // ظل خفيف
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Container(
        width: 25,
        height: 25,

        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.chevron_left,
          size: 15,
          color: AppColors.white,
        ),
      ),
    );

    //endThumbIcon
    final Widget endThumbIcon = Container(
      height: 31.w,
      width: 55.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1), // ظل خفيف
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: AppColors.natural7, width: 3),
      ),
      child: Container(
        width: 25,
        height: 25,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.chevron_right,
          size: 15,
          color: AppColors.white,
        ),
      ),
    );

    return SfRangeSlider(
      values: _values,
      interval: 200,
      activeColor: AppColors.primary,
      inactiveColor: AppColors.natural2,
      min: 0,
      max: 1000,
      startThumbIcon: startThumbIcon,
      endThumbIcon: endThumbIcon,
      enableTooltip: true,
      tooltipTextFormatterCallback:
          (dynamic actualValue, String formattedText) {
            return '\$ ${actualValue.round()}'; //
          },
      onChanged: (SfRangeValues value) {
        setState(() {
          _values = value;
        });
      },
    );
  }
}
