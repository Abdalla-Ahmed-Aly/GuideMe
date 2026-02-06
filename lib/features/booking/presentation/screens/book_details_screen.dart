
import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_tourist_details_widgets/book_tourist_details_body.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookTouristDetailsBody(),
    );
  }
}