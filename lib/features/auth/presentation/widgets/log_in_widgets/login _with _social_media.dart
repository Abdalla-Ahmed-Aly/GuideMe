import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginWithSocialMedia extends StatelessWidget {
  const LoginWithSocialMedia(this.svgAsset, {super.key});
  final String svgAsset;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(10),
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
