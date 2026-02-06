import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/widgets/images_indicator.dart';

class PlaceImages extends StatefulWidget {
  const PlaceImages({super.key});

  @override
  State<PlaceImages> createState() => _PlaceImagesState();
}

class _PlaceImagesState extends State<PlaceImages> {
  int _currentIndex = 0;
  late final PageController _pageController;
  final List<String> _images = [
    AppImages.placeTest,
    AppImages.test1,
    AppImages.test2,
    AppImages.test3,
    AppImages.test4,
    AppImages.test5,
    AppImages.test6,
    AppImages.test7,
    AppImages.test8,
  ];

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
          itemCount: _images.length,
          itemBuilder: (context, index) {
            return Image.asset(
              _images[index],
              fit: BoxFit.cover,
            );
          },
        ),

        Positioned(
          bottom: 28,
          right: 20,
          child: ImagesIndicator(
            images: _images,
            currentIndex: _currentIndex,
            pageController: _pageController,
          ),
        ),
      ],
    );
  }
}
