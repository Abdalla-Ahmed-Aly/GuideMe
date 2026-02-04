import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_atour_body/book_atour_body.dart';

class ListviewBuilderBookAtour extends StatelessWidget {
  const ListviewBuilderBookAtour({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 28),
      itemBuilder: (context, index) {
        return const BookAtourBody();
      },
      itemCount: 20,
    );
  }
}
