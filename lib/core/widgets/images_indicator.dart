import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';

class ImagesIndicator extends StatelessWidget {
  const ImagesIndicator({
    super.key,
    required this.images,
    required this.currentIndex,
    required this.pageController,
  });
  final List<String> images;
  final int currentIndex;
  final PageController pageController;

  List<Widget> _buildDynamicIndicator() {
    final List<Widget> widgets = [];

    final int total = images.length;

    if (total == 0) return [];

    int start;
    int end;

    if (total == 5) {
      start = 0;
      end = 4;
    }
    // 🟢 أول الليست (4 صور + plus تحت)
    else if (currentIndex <= 2) {
      start = 0;
      end = 3; // 4 صور
    }
    // 🟢 آخر الليست (plus فوق + 4 صور)
    else if (currentIndex >= total - 3) {
      start = total - 4;
      end = total - 1; // 4 صور
    }
    // 🟡 في النص (plus فوق + 3 صور + plus تحت)
    else {
      start = currentIndex - 1;
      end = currentIndex + 1; // 3 صور
    }

    // حماية
    if (start < 0) start = 0;
    if (end > total - 1) end = total - 1;

    final int hiddenTop = start;
    final int hiddenBottom = total - end - 1;

    // + فوق
    if (hiddenTop > 0) {
      widgets.add(_buildPlusCircle(hiddenTop));
    }

    // الصور
    for (int i = start; i <= end; i++) {
      widgets.add(
        _buildImageCircle(
          i,
          isCurrent: i == currentIndex,
        ),
      );
    }

    // + تحت
    if (hiddenBottom > 0) {
      widgets.add(_buildPlusCircle(hiddenBottom));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.17),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: _buildDynamicIndicator(),
      ),
    );
  }

  Widget _buildImageCircle(int imageIndex, {bool isCurrent = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: () {
          pageController.animateToPage(
            imageIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: isCurrent ? 2 : 0,
            ),
          ),
          child: CircleAvatar(
            radius: 20.h,
            child: ClipOval(
              child: CustomNetworkImage(
                imageUrl: images[imageIndex],
                fit: BoxFit.cover,
                width: 40.h, // Corresponds to radius * 2
                height: 40.h,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlusCircle(int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: CircleAvatar(
        radius: 20.h,
        backgroundColor: Colors.black.withValues(alpha: 0.6),
        child: Text(
          "+$count",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
