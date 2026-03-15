import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:shimmer/shimmer.dart';

class BookingShimmerListView extends StatelessWidget {
  const BookingShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 22.p, vertical: 8),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 90.h,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );

        //   return Container(
        //     padding: const EdgeInsets.all(16),
        //     margin: const EdgeInsets.only(bottom: 20),
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Shimmer.fromColors(
        //           baseColor: Colors.grey.shade300,
        //           highlightColor: Colors.grey.shade100,
        //           child: Container(
        //             height: 20,
        //             width: 100.w,
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(15),
        //             ),
        //           ),
        //         ),
        //         SizedBox(height: 8.h),
        //         Shimmer.fromColors(
        //           baseColor: Colors.grey.shade300,
        //           highlightColor: Colors.grey.shade100,
        //           child: Container(
        //             height: 28,
        //             width: context.screenWidth * .6,
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(15),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   );
      },
    );
  }
}
