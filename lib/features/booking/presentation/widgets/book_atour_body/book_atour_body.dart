import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

import 'package:guide_me/features/booking/presentation/widgets/book_atour_body/information_tour_guide.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_atour_body/primary_action_button.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_atour_body/profile_of_tour_guide.dart';

class BookAtourBody extends StatefulWidget {
  const BookAtourBody({super.key});

  @override
  State<BookAtourBody> createState() => _BookAtourBodyState();
}

class _BookAtourBodyState extends State<BookAtourBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // CustomAppbar(
        //   text: context.l10n.book,
        // ),
        const ProfileOfTourGuide(),
        SizedBox(
          height: 23.h,
        ),
        Padding(
          padding: EdgeInsets.only(right: 100.p),
          child: Text(
            context.l10n.experienced,
            style: AppTextStyles.interBold14.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 50.p),
          child: Text(
            context.l10n.pharaonic,
            style: AppTextStyles.interBold14.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        const InformationTourGuide(),
        SizedBox(
          height: 25.h,
        ),
        const PrimaryActionButton(),
        SizedBox(
          height: 20.h,
        ),

        // const Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: Divider(
        //     height: 1,
        //     thickness: 4.0,
        //     indent: 1,
        //     endIndent: 1,
        //     color: Color(0xFFE0E0E0),
        //   ),
        // ),
      ],
    );
  }
}
