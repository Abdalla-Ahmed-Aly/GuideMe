import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';

class LoginWithSocialMedia extends StatelessWidget {
  const LoginWithSocialMedia(this.svgAsset, {super.key});
  final String svgAsset;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76.w,
      height: 48.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Center(
          child: SvgPicture.asset(
            svgAsset,
          ),
        ),
      ),
    );
  }
}
