import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';

class InformationTourGuide extends StatelessWidget {
  const InformationTourGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.p, right: 25.p),
      child: Row(
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
          Padding(
            padding: EdgeInsets.only(right: 32.p, left: 32.p),
            child: Text(
              'Luxor & Aswan',
              style: TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                fontSize: 14.fs,
                color: AppColors.black,
              ),
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
