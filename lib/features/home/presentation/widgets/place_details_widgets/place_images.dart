import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';

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

  List<Widget> _buildDynamicIndicator() {
    final List<Widget> widgets = [];

    final int total = _images.length;

    int start;
    int end;

    if (total == 5) {
      start = 0;
      end = 4;
    }
    // 🟢 أول الليست (4 صور + plus تحت)
    else if (_currentIndex <= 2) {
      start = 0;
      end = 3; // 4 صور
    }
    // 🟢 آخر الليست (plus فوق + 4 صور)
    else if (_currentIndex >= total - 3) {
      start = total - 4;
      end = total - 1; // 4 صور
    }
    // 🟡 في النص (plus فوق + 3 صور + plus تحت)
    else {
      start = _currentIndex - 1;
      end = _currentIndex + 1; // 3 صور
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
          isCurrent: i == _currentIndex,
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
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.17),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: _buildDynamicIndicator(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageCircle(int imageIndex, {bool isCurrent = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: () {
          _pageController.animateToPage(
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
            backgroundImage: AssetImage(_images[imageIndex]),
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
