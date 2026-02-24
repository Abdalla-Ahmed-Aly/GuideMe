import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class AvailabilityStatusSection extends StatefulWidget {
  const AvailabilityStatusSection({
    super.key,
  });

  @override
  State<AvailabilityStatusSection> createState() =>
      _AvailabilityStatusSectionState();
}

class _AvailabilityStatusSectionState extends State<AvailabilityStatusSection> {
  bool isonline = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: const Color(0xffFFE5BA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                'Availability',
                style: AppTextStyles.poppinsMedium18,
              ),

              Row(
                children: [
                  Text(
                    'Your are currently ',
                    style: AppTextStyles.poppinsMedium18.copyWith(
                      color: const Color(0xffB59A64),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    'online',
                    style: AppTextStyles.poppinsMedium18.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Switch(
                    activeThumbColor: AppColors.primary,
                    inactiveThumbColor: Colors.white,
                    value: isonline,
                    onChanged: (value) {
                      setState(() {
                        isonline = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
