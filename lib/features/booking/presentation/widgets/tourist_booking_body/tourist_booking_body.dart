

import 'package:flutter/material.dart';
import 'package:guide_me/core/widgets/app_button.dart';

class TouristBookingBody extends StatelessWidget {
  const TouristBookingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      physics:const ClampingScrollPhysics(),
      child: Column(
        children: [
          AppButton(onPressed: (){}, text: "")
          
        ],
      ),
    );
  }
}