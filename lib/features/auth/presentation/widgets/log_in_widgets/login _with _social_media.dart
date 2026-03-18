import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginWithSocialMedia extends StatelessWidget {
  const LoginWithSocialMedia(
    this.svgAsset, {
    super.key,
    required this.onTap,
    this.isLoading = false,
  });

  final String svgAsset;
  final VoidCallback? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onTap, 
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : SvgPicture.asset(svgAsset),
        ),
      ),
    );
  }
}
