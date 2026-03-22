import 'package:flutter/material.dart';
import 'package:guide_me/core/shared/entities/place_entity.dart';
import 'package:guide_me/core/widgets/images_indicator.dart';

class PlaceImages extends StatefulWidget {
  final PlaceEntity place;
  const PlaceImages({super.key, required this.place});

  @override
  State<PlaceImages> createState() => _PlaceImagesState();
}

class _PlaceImagesState extends State<PlaceImages> {
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
          itemCount: widget.place.images.length,
          itemBuilder: (context, index) {
            return Image.network(
              widget.place.images[index],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(Icons.error, color: Colors.red, size: 48),
              ),
            );
          },
        ),

        Positioned(
          bottom: 28,
          right: 20,
          child: ImagesIndicator(
            images: widget.place.images,
            currentIndex: _currentIndex,
            pageController: _pageController,
          ),
        ),
      ],
    );
  }
}
