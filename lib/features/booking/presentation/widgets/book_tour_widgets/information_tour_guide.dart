import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';

class InformationTourGuide extends StatelessWidget {
  const InformationTourGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.p),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Ancient Egypt',
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
              fontSize: 14.fs,
              color: AppColors.black,
            ),
          ),
          Text(
            'Luxor & Aswan',
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
              fontSize: 14.fs,
              color: AppColors.black,
            ),
          ),
          Text(
            'Nile Cruises',
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
              fontSize: 14.fs,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
