
import 'package:flutter/material.dart';

class DynamicStars extends StatelessWidget {
  final int rating; 
  final Color color;
  final double size;

  const DynamicStars({
    super.key,
    required this.rating,
    this.color = Colors.orange,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating) {
          return Icon(Icons.star, color: color, size: size);
        } else {
          return Icon(Icons.star_border, color: color, size: size);
        }
      }),
    );
  }
}