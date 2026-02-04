import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomRangeSliderPeople extends StatefulWidget {
  const CustomRangeSliderPeople({super.key});

  @override
  State<CustomRangeSliderPeople> createState() =>
      _CustomRangeSliderPeopleState();
}

class _CustomRangeSliderPeopleState extends State<CustomRangeSliderPeople> {
  double _value = 11.0;

  @override
  Widget build(BuildContext context) {
    final Widget startThumbIcon = Container(
      height: 31,
      width: 31,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.natural2, width: 3),
      ),
      child: Container(
        height: 28,
        width: 28,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
      ),
    );
    return SfSlider(
      value: _value,
      min: 0,
      max: 20,
      activeColor: Colors.orange,
      inactiveColor: AppColors.natural2,
      thumbIcon: startThumbIcon,
      enableTooltip: true,
      tooltipTextFormatterCallback:
          (dynamic actualValue, String formattedText) {
            return 'person ${actualValue.round()}'; //
          },

      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
    );
  }
}
