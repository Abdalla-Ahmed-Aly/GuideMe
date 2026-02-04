import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_information_body/details_booking_place.dart';

class BookInformationBody extends StatefulWidget {
  const BookInformationBody({super.key});

  @override
  State<BookInformationBody> createState() => _BookInformationBodyState();
}

class _BookInformationBodyState extends State<BookInformationBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            AppImages.pyramids,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 20.p,
          top: 50.p,
          child: const ArrowBackButton(
            color: AppColors.black,
          ),
        ),

        const Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: DetailsBookingPlace(),
        ),
      ],
    );
  }
}
