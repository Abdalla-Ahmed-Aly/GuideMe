import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/styles/app_colors.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key ,this.color});
final  Color? color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Container(
        height: size.height * 0.05,
        width: size.height * 0.05,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color:color?? AppColors.natural2 ,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppIcons.arrowBack,
            width: size.height * 0.013,
          ),
        ),
      ),
    );
  }
}
