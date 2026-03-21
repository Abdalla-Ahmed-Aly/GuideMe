import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/widgets/custom_shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = context.isPortrait ? size.height * 0.075 : size.width * 0.075;
    return Container(
      margin: const EdgeInsets.only(right: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomShimmer(
            width: width,
            height: width,
            borderRadius: 20,
          ),
          const SizedBox(height: 10),
          CustomShimmer(
            width: width * 1.1,
            height: 12,
            borderRadius: 4,
          ),
        ],
      ),
    );
  }
}

class CityShimmer extends StatelessWidget {
  const CityShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = context.isPortrait ? size.height * 0.23 : size.width * 0.23;
    return CustomShimmer(
      width: width,
      height: 150, // Typical height for CityCard
      borderRadius: 12,
      margin: const EdgeInsets.only(right: 16),
    );
  }
}

class PlaceShimmer extends StatelessWidget {
  const PlaceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = context.isPortrait ? size.height * 0.25 : size.width * 0.25;
    final imageHeight = context.isPortrait
        ? size.height * 0.23
        : size.width * 0.23;

    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomShimmer(
            width: width,
            height: imageHeight,
            borderRadius: 20,
          ),
          const SizedBox(height: 8),
          const CustomShimmer(
            width: 150,
            height: 16,
            borderRadius: 4,
          ),
          const SizedBox(height: 4),
          const CustomShimmer(
            width: 100,
            height: 12,
            borderRadius: 4,
          ),
        ],
      ),
    );
  }
}

class PlaceListTileShimmer extends StatelessWidget {
  const PlaceListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          CustomShimmer(
            width: 100,
            height: 100,
            borderRadius: 12,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomShimmer(width: double.infinity, height: 16),
                SizedBox(height: 8),
                CustomShimmer(width: 150, height: 12),
                SizedBox(height: 8),
                CustomShimmer(width: 80, height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AILoadingCard extends StatefulWidget {
  const AILoadingCard({super.key});

  @override
  State<AILoadingCard> createState() => _AILoadingCardState();
}

class _AILoadingCardState extends State<AILoadingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _pulseAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.2), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14159).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width * 0.87;
    final height = context.isPortrait ? size.height * 0.41 : size.width * 0.41;

    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xff0A0A0A),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff00D1FF).withOpacity(0.05),
            blurRadius: 30,
            spreadRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            // Background grid pattern
            Positioned.fill(
              child: CustomPaint(
                painter: _NeuralGridPainter(progress: _controller.value),
              ),
            ),

            // Central Neural Core
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer glow
                      Container(
                        width: 120 * _pulseAnimation.value,
                        height: 120 * _pulseAnimation.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              const Color(0xff00D1FF).withOpacity(0.15),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),

                      // Rotating Orbit 1
                      Transform.rotate(
                        angle: _rotationAnimation.value,
                        child: _OrbitRing(
                          radius: 60,
                          dotColor: const Color(0xff00D1FF),
                        ),
                      ),

                      // Rotating Orbit 2 (reverse)
                      Transform.rotate(
                        angle: -_rotationAnimation.value * 1.5,
                        child: _OrbitRing(
                          radius: 45,
                          dotColor: Colors.purpleAccent,
                        ),
                      ),

                      // The Core Icon
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff1A1A1A),
                          border: Border.all(
                            color: const Color(0xff00D1FF).withOpacity(0.3),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff00D1FF).withOpacity(0.2),
                              blurRadius: 15,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.auto_awesome,
                          color: Color(0xff00D1FF),
                          size: 32,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Scanning light effect
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Positioned(
                  top: (height + 100) * (_controller.value) - 50,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          const Color(0xff00D1FF).withOpacity(0.5),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // Bottom Text
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    "INTELLIGENT CURATION",
                    style: TextStyle(
                      color: const Color(0xff00D1FF).withOpacity(0.7),
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Analyzing your preferences...",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrbitRing extends StatelessWidget {
  final double radius;
  final Color dotColor;
  const _OrbitRing({required this.radius, required this.dotColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: dotColor.withOpacity(0.1), width: 1),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: radius - 3,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dotColor,
                boxShadow: [
                  BoxShadow(color: dotColor, blurRadius: 10, spreadRadius: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NeuralGridPainter extends CustomPainter {
  final double progress;
  _NeuralGridPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff00D1FF).withOpacity(0.05)
      ..strokeWidth = 0.5;

    final double step = 30;
    for (double i = 0; i < size.width; i += step) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double j = 0; j < size.height; j += step) {
      canvas.drawLine(Offset(0, j), Offset(size.width, j), paint);
    }

    // Moving dots on grid
    final dotPaint = Paint()..color = const Color(0xff00D1FF).withOpacity(0.1);
    for (int i = 1; i < 5; i++) {
      double x = (size.width * (i / 5) + (progress * 100)) % size.width;
      double y = (size.height * (i / 3) + (progress * 150)) % size.height;
      canvas.drawCircle(Offset(x, y), 2, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _NeuralGridPainter oldDelegate) => true;
}
