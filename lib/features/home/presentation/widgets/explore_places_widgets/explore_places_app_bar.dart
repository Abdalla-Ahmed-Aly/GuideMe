import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';

class ExplorePlacesAppBar extends StatelessWidget {
  const ExplorePlacesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Row(
      children: [
        const ArrowBackButton(),

        Expanded(
          child: Text(
            'Pharaohs',
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.poppinsSemiBold26,
          ),
        ),

        SizedBox(width: size.height * 0.06),
      ],
    );
  }
}
