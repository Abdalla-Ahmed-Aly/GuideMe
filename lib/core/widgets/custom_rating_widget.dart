import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingWidget extends StatefulWidget {
  const CustomRatingWidget({super.key});

  @override
  State<CustomRatingWidget> createState() => _CustomRatingWidgetState();
}

class _CustomRatingWidgetState extends State<CustomRatingWidget> {
  double rating = 4;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: 4,
          minRating: 1,
          allowHalfRating: true,
          direction: Axis.horizontal,
          itemCount: 5,
          itemSize: 20,
          itemBuilder: (context, index) {
            return const Icon(
              Icons.star,
              color: Colors.amber,
            );
          },
          onRatingUpdate: (double newrating) {
            setState(() {
              rating = newrating;
            });
          },
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          rating.toString(),
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ],
    );
  }
}
