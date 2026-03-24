import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';
import 'package:guide_me/features/home/domain/entity/package_entity.dart';

class MostFamousTripCard extends StatefulWidget {
  final PackageEntity package;
  final double scrollOffset;
  final int index;

  const MostFamousTripCard({
    super.key,
    required this.package,
    required this.scrollOffset,
    required this.index,
  });

  @override
  State<MostFamousTripCard> createState() => _MostFamousTripCardState();
}

class _MostFamousTripCardState extends State<MostFamousTripCard>
    with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  late Color glowColor;
  late List<String> tags;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    final colors = [
      Colors.blue,
      Colors.purple,
      Colors.orange,
      Colors.teal,
      Colors.pink,
    ];

    glowColor = colors[widget.index % colors.length];

    tags = [
      "AI Pick",
      "Trending",
      "Smart Choice",
      "Top Rated",
      "Recommended"
    ]..shuffle();
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
    final height =
        context.isPortrait ? size.height * 0.41 : size.width * 0.41;

    double itemWidth = width + 16;
    double relativePos = (widget.index * itemWidth) - widget.scrollOffset;
    double parallaxOffset = (relativePos / size.width) * 80;

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      onTap: () {
        if (widget.package.places.isNotEmpty) {
          context.push(
            AppRoutes.placeDetailsScreen,
            extra: widget.package.places.first,
          );
        }
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 10, end: 0),
          duration: const Duration(milliseconds: 600),
          builder: (context, blur, child) {
            return ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: child,
            );
          },
          child: Container(
            width: width,
            height: height,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: glowColor.withValues(alpha: 0.4),
                  blurRadius: 30,
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: [
                  // IMAGE + PARALLAX
                  Positioned.fill(
                    left: -50 + parallaxOffset,
                    right: -50 - parallaxOffset,
                    child: Hero(
                      tag: 'package_${widget.package.title}',
                      child: CustomNetworkImage(
                        imageUrl: widget.package.packagePhoto,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // GRADIENT
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.4),
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),

                  // TOP BADGE
                  Positioned(
                    top: 20,
                    left: 20,
                    child: _glassTag("AI MAGIC"),
                  ),

                  // FAVORITE
                  Positioned(
                    top: 20,
                    right: 20,
                    child: GestureDetector(
                      onTap: () =>
                          setState(() => isFavorite = !isFavorite),
                      child: _glassCircle(
                        icon: isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                      ),
                    ),
                  ),

                  // CONTENT
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.package.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.poppinsBold28.copyWith(
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // TAGS (AI FEEL)
                          SizedBox(
                            height: 28,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 2,
                              itemBuilder: (_, i) {
                                return Container(
                                  margin:
                                      const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(20),
                                    color: glowColor
                                        .withValues(alpha: 0.25),
                                  ),
                                  child: Text(
                                    tags[i],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10),
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 12),

                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  color: AppColors.primary, size: 16),
                              Text(widget.package.city.name,
                                  style: const TextStyle(
                                      color: Colors.white70)),
                              const Spacer(),
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 16),
                              const Text("4.9",
                                  style:
                                      TextStyle(color: Colors.white)),
                            ],
                          ),

                          const SizedBox(height: 16),

                          _glassPrice(
                              "${widget.package.totalPrice} ${context.l10n.egp}"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _glassTag(String text) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          color: Colors.white.withValues(alpha: 0.2),
          child: Text(text,
              style:
                  const TextStyle(color: Colors.white, fontSize: 12)),
        ),
      ),
    );
  }

  Widget _glassCircle({required IconData icon, required Color color}) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white.withValues(alpha: 0.2),
          child: Icon(icon, color: color, size: 18),
        ),
      ),
    );
  }

  Widget _glassPrice(String price) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.white.withValues(alpha: 0.15),
          child: Text(price,
              style:
                  const TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ),
    );
  }
}