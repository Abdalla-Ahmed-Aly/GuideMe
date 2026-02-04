import 'package:flutter/material.dart';

import 'package:guide_me/features/booking/presentation/widgets/book_screen_body/book_screen_body.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookScreenBody(),
    );
  }
}
