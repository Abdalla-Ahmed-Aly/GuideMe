import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';
import 'package:guide_me/core/shared/entities/place_info_entity.dart';

class PackagePlaceImages extends StatefulWidget {
  const PackagePlaceImages({super.key});

  @override
  State<PackagePlaceImages> createState() => _PackagePlaceImagesState();
}

class _PackagePlaceImagesState extends State<PackagePlaceImages> {
  late PageController _pageController;
  int _currentIndex = 0;

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
    final place = GoRouterState.of(context).extra as PlaceInfoEntity;
    return Stack(
      children: [
        PageView.builder(
          itemCount: place.images.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Hero(
                tag: place.id,
                child: CustomNetworkImage(
                  imageUrl: place.images[index],
                  fit: BoxFit.cover,
                ),
              );
            }
            return CustomNetworkImage(
              imageUrl: place.images[index],
              fit: BoxFit.cover,
            );
          },
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),

        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: _PackagePlaceImageIndicator(
            count: place.images.length,
            currentIndex: _currentIndex,
          ),
        ),
      ],
    );
  }
}

class _PackagePlaceImageIndicator extends StatelessWidget {
  const _PackagePlaceImageIndicator({
    required this.count,
    required this.currentIndex,
  });
  final int count;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: currentIndex == index ? 24 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: currentIndex == index
                ? Colors.white
                : Colors.white.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(999),
          ),
        );
      }),
    );
  }
}
