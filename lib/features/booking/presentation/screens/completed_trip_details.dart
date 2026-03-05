
import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/widgets/completed_trip_deatailes/completed_trip_detailes_section.dart';

class CompletedTripDetails extends StatelessWidget {
  const CompletedTripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:CompletedTripDetailesSection() ,
    );
  }
}