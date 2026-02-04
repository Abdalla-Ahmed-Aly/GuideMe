

import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_information_body/book_information_body.dart';

class BookInformationScreen extends StatelessWidget {
  const BookInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      body: BookInformationBody(),
    );
  }
}