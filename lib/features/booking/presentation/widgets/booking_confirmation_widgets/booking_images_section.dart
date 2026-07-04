import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';
import 'package:guide_me/core/widgets/images_indicator.dart';
import 'package:guide_me/features/booking/presentation/args/book_place_args.dart';

class BookingImagesSection extends StatefulWidget {
  const BookingImagesSection({super.key});

  @override
  State<BookingImagesSection> createState() => _BookingImagesSectionState();
}

class _BookingImagesSectionState extends State<BookingImagesSection> {
  int _currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bookPlaceArgs = GoRouterState.of(context).extra as BookPlaceArgs;
    final place = bookPlaceArgs.place;
    final size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        // Images
        PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemCount: place.images.length,
          itemBuilder: (context, index) {
            return CustomNetworkImage(
              imageUrl: place.images[index],
              fit: BoxFit.cover,
            );
          },
        ),

        Positioned(
          bottom: 46,
          right: context.isArabic ? null : 20,
          left: context.isArabic ? 20 : null,
          child: ImagesIndicator(
            images: place.images,
            currentIndex: _currentIndex,
            pageController: _pageController,
          ),
        ),
      ],
    );
  }
}
