import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/place_entity.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';
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
            if (index == 0) {
              return Hero(
                tag: widget.place.id,
                child: CustomNetworkImage(
                  imageUrl: widget.place.images[index],
                  fit: BoxFit.cover,
                ),
              );
            }
            return CustomNetworkImage(
              imageUrl: widget.place.images[index],
              fit: BoxFit.cover,
            );
          },
        ),

        Positioned(
          bottom: 28,
          right: context.isEnglish ? 20.p : null,
          left: context.isArabic ? 20.p : null,
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
