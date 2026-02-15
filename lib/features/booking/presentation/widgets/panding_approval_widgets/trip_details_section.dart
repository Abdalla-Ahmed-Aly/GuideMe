import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';

class TripDetailsSection extends StatelessWidget {
  const TripDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.p),
          child: Row(
            children: [
              CustomTripdetails(
                title: 'Date',
                value: 'Oct 24 , 2026',
                pathicon: SvgPicture.asset(AppIcons.clender),
              ),
              SizedBox(
                width: 100.p,
              ),
              CustomTripdetails(
                pathicon: SvgPicture.asset(AppIcons.time),
                title: 'Time',
                value: '09:00 AM',
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.p),
          child: Row(
            children: [
              const CustomTripdetails(
                title: 'Duration',
                value: '4 Hours',
                pathicon: Icon(
                  FontAwesomeIcons.hourglassEnd,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 130.p,
              ),
              CustomTripdetails(
                pathicon: SvgPicture.asset(AppIcons.people),
                title: 'Group Size',
                value: '3 People',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTripdetails extends StatelessWidget {
  const CustomTripdetails({
    super.key,
    required this.title,
    required this.value,
    required this.pathicon,
  });

  final String title;
  final String value;
  final Widget pathicon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40.w,
          height: 40.h,
          decoration: const BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: Padding(padding: const EdgeInsets.all(12), child: pathicon),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15.fs,
                  color: const Color(0xff7C6965),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 16.fs,
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),

            //
          ],
        ),
      ],
    );
  }
}
